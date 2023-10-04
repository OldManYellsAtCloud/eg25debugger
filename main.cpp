#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include "eg25connection.h"

#include "unistd.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    const QUrl url(u"qrc:/eg25debugger/Main.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
        &app, [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        }, Qt::QueuedConnection);
    engine.load(url);

    /*auto *whatev = new eg25connection();
    whatev->writeData("ATI");
    sleep(1);
    whatev->writeData("AT+GMI"); */
    return app.exec();
}
