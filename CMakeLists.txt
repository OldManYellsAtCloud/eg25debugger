cmake_minimum_required(VERSION 3.16)

project(eg25debugger VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_STANDARD 20)

find_package(Qt6 6.2 REQUIRED COMPONENTS Quick SerialPort)


qt_add_executable(appeg25debugger
    main.cpp
    eg25connection.h eg25connection.cpp
)

qt_add_qml_module(appeg25debugger
    URI eg25debugger
    VERSION 1.0
    QML_FILES Main.qml
)

target_link_libraries(appeg25debugger
    PRIVATE Qt6::Quick Qt6::SerialPort
)

include(GNUInstallDirs)
install(TARGETS appeg25debugger
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
