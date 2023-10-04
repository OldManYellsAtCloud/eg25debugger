#include "eg25connection.h"
#include <QtSerialPort/QSerialPortInfo>

#include <string>
#include <unistd.h>

void eg25connection::truncateVector()
{
    if (logbook->size() > 200) {
        logbook->erase(logbook->begin(), logbook->begin() + (logbook->size() - 200));
    }
}

eg25connection::eg25connection(QObject *parent)
    : QObject{parent}
{
    logbook = new std::vector<std::string>();
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

    readerThread = new std::thread{&eg25connection::readData, this};
}

void eg25connection::readData(){
    int numread;
    bool ready;
    while(running){
        ready = serialPort->waitForReadyRead(500);
        if (ready) {
            numread = serialPort->read(buffer, 1024);
            qDebug() << "Successfully read " << numread << " bytes: " << buffer;
            logbook->push_back("Data in: " + std::string(buffer));
            *logFile << "=== Data in ===\n";
            *logFile << buffer;
            logFile->flush();
            truncateVector();
            serialPort->clear();
        }
    }
}

eg25connection::~eg25connection()
{
    running = false;
    readerThread->join();
    serialPort->close();
    delete(serialPort);
    delete(logbook);
    delete(logFile);
    delete(file);
}

void eg25connection::writeData(std::string data)
{
    if (!data.ends_with("\r\n"))
        data += "\r\n";

    *logFile << "=== Data out ===\n";
    *logFile << data.c_str();
    logbook->push_back("Data out: " + data);
    truncateVector();
    if (serialPort == nullptr || !serialPort->isOpen()){
        throw std::logic_error("Can't write data, serial port is not initialized!");
    }

    int res = serialPort->write(data.c_str());
    serialPort->waitForBytesWritten(300000);
    qDebug() << "Written " << res << " number of bytes.";
}

