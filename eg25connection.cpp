#include "eg25connection.h"
#include <QtSerialPort/QSerialPortInfo>

#include <string>
#include <unistd.h>

std::string eg25connection::parseResponse(const std::string& s)
{
    std::string response = "";
    std::string token;
    int index, length;
    int i = s.length();
    bool foundOK = false;
    while (i > 0){
        index = s.rfind("\n", i);
        length = i - index;
        token = s.substr(index, length);
        if (token == "\nOK") {
            if (!foundOK) {
                foundOK = true;
            } else {
                break;
            }
        }
        response = token + response;
        i -= (length + 1);
    }

    return response;

}

bool eg25connection::isResponseFinished(const std::string& response, const std::string& success, const std::string& error)
{
    size_t success_pos = response.rfind(success);
    if (success_pos != std::string::npos && success_pos >= (response.size() - success.size() - 3)) {
        return true;
    }

    size_t error_pos = response.rfind(error);
    if (error_pos != std::string::npos && error_pos >= (response.size() - error.size() - 3)) {
        return true;
    }
    return false;
}

eg25connection::eg25connection(QObject *parent)
    : QObject{parent}
{
    file = new QFile("/tmp/modemlog");

    bool res = file->open(QIODeviceBase::ReadWrite | QIODeviceBase::Truncate);
    if (!res) {
        qDebug() << "Could not open logfile";
        throw std::logic_error("Could not open logfile");
    }

    logFile = new QTextStream(file);

    auto availablePorts = QSerialPortInfo::availablePorts();
    for (const QSerialPortInfo &ap: availablePorts){
        qDebug() << "portname: " << ap.portName();
        if (ap.portName() == "ttyUSB2") {
            serialPort = new QSerialPort(ap);
            serialPort->open(QIODeviceBase::ReadWrite);
            qDebug() << "is open? " << serialPort->isOpen();
            break;
        }
    }

    if (serialPort == nullptr) {
        throw std::logic_error("Could not find ttyUSB2 serial port!");
    }
}

std::string eg25connection::getResponse(const at_command_spec& cmd_spec){
    bool ready;
    bool response_finished = false;
    int timeout = cmd_spec.timeout;
    std::string response;

    while (timeout > 0 && !response_finished){
        ready = serialPort->waitForReadyRead(100);
        if (ready) {
            buffer = serialPort->readAll();
            //serialPort->read(buffer, 1024);
            *logFile << "=== Data in ===\n";
            *logFile << buffer;
            logFile->flush();
            serialPort->clear();

            response = parseResponse(buffer.constData());
            response_finished = isResponseFinished(response, cmd_spec.success, cmd_spec.error);
        }

        timeout -= 100;

    }

    return response;
}

eg25connection::~eg25connection()
{
    serialPort->close();
    delete(serialPort);
    delete(logFile);
    delete(file);
}

//std::string eg25connection::writeData(std::string data)
std::string eg25connection::writeData(std::string cmd, const at_command_spec& cmd_spec)
{
    if (!cmd.ends_with("\r\n"))
        cmd += "\r\n";

    *logFile << "=== Data out ===\n";
    *logFile << cmd.c_str();
    if (serialPort == nullptr || !serialPort->isOpen()){
        throw std::logic_error("Can't write data, serial port is not initialized!");
    }


    int res = serialPort->write(cmd.c_str());
    serialPort->waitForBytesWritten(300000);
    return getResponse(cmd_spec);
}

bool eg25connection::unlockSim(QString qPin)
{
    std::string pin = qPin.toStdString();
    std::string res = writeData("AT+CPIN=" + pin, commands["AT+CPIN"]);
    return true;
}

void eg25connection::connectToNetwork()
{
    writeData("AT+QSCLK=0", commands["AT+QSCLK"]);
    writeData("AT+CGATT=0", commands["AT+CGATT"]);
    writeData("AT+CFUN=4", commands["AT+CFUN"]);
    writeData("AT+CGDCONT=1,\"IP\",\"internet\"", commands["AT+CGDCONT"]);
    writeData("AT+CFUN=1", commands["AT+CFUN"]);
    writeData("AT+CGATT=1", commands["AT+CGATT"]);
}


