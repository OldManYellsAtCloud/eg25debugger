#ifndef EG25CONNECTION_H
#define EG25CONNECTION_H

#include <QQmlEngine>
#include <thread>

#include <QtSerialPort/QSerialPort>

class eg25connection : public QObject
{
    Q_OBJECT
    QML_ELEMENT

private:
    QSerialPort *serialPort = nullptr;
    char buffer[1024];
    std::vector<std::string> *logbook;

    std::thread readerThread;
    bool running = true;

public:
    explicit eg25connection(QObject *parent = nullptr);
    ~eg25connection();
    void readData();
    void writeData(std::string data);

signals:
    void dataAvailable();
};

#endif // EG25CONNECTION_H
