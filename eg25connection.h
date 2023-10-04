#ifndef EG25CONNECTION_H
#define EG25CONNECTION_H

#include <QQmlEngine>
#include <thread>

#include <QtSerialPort/QSerialPort>
#include <QFile>

class eg25connection : public QObject
{
    Q_OBJECT
    QML_ELEMENT

private:
    QSerialPort *serialPort = nullptr;
    char buffer[1024];
    std::vector<std::string> *logbook;
    QFile *file;
    QTextStream *logFile;

    std::thread *readerThread;
    bool running = true;

    void truncateVector();
public:
    explicit eg25connection(QObject *parent = nullptr);
    ~eg25connection();
    void readData();
    void writeData(std::string data);

signals:
    void dataAvailable();
};

#endif // EG25CONNECTION_H
