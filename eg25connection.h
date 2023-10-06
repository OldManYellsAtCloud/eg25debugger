#ifndef EG25CONNECTION_H
#define EG25CONNECTION_H

#include <QQmlEngine>
#include <QtSerialPort/QSerialPort>
#include <QFile>

#include <at_commands.h>

class eg25connection : public QObject
{
    Q_OBJECT
    QML_ELEMENT

private:
    QSerialPort *serialPort = nullptr;
    //char buffer[1024];
    QByteArray buffer;
    QFile *file;
    QTextStream *logFile;

    void truncateVector();
    std::string parseResponse(const std::string& s);
    bool isResponseFinished(const std::string& response, const std::string& success, const std::string& error);
public:
    explicit eg25connection(QObject *parent = nullptr);
    ~eg25connection();
    //std::string getResponse(int timeout = 300000);
    std::string getResponse(const at_command_spec& cmd_spec);
    //std::string writeData(std::string data);
    std::string writeData(std::string cmd, const at_command_spec& cmd_spec);
    Q_INVOKABLE bool unlockSim(QString pin);
    Q_INVOKABLE void connectToNetwork();

signals:
    void dataAvailable();
};

#endif // EG25CONNECTION_H
