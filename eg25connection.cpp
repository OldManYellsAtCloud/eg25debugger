#include "eg25connection.h"
#include <QtSerialPort/QSerialPortInfo>

#include <string>

eg25connection::eg25connection(QObject *parent)
    : QObject{parent}
{
    logbook = new std::vector<std::string>();

    auto availablePorts = QSerialPortInfo::availablePorts();
    for (const QSerialPortInfo &ap: availablePorts){
        if (ap.portName() == "ttyUSB2") {
            serialPort = new QSerialPort(ap);
            serialPort->open(QIODeviceBase::ReadWrite);
            break;
        }
    }

    if (serialPort == nullptr) {
        throw std::logic_error("Could not find ttyUSB2 serial port!");
    }

    readerThread = new std::thread{&eg25connection::readData, this};
}

void eg25connection::readData(){
    while(running){

    }
}

eg25connection::~eg25connection()
{
    serialPort->close();
    delete(serialPort);
    delete(logbook);
}

void eg25connection::writeData(std::string data)
{
    if (serialPort == nullptr || !serialPort->isOpen()){
        throw std::logic_error("Can't write data, serial port is not initialized!");
    }

    serialPort->write(data.c_str(), data.size());
}
