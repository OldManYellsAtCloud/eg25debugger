#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include "eg25connection.h"
#include "at_commands.h"

#include "unistd.h"

void init_at_commands(){
    commands["AT+QSCLK"] = {};
    commands["AT+CPIN"] = {.success = "PB DONE", .timeout = 15000};
    commands["AT+CFUN"] = {.timeout = 1000};
    commands["AT+CGATT"] = {.timeout = 1500};
    commands["AT+CGDCONT"] = {};
}


int main(int argc, char *argv[])
{
    init_at_commands();

    QGuiApplication app(argc, argv);

    qmlRegisterType<eg25connection>("sgy.pine.launcher", 1, 0, "Eg25connection");

    QQmlApplicationEngine engine;
    const QUrl url(u"qrc:/eg25debugger/Main.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
        &app, [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
