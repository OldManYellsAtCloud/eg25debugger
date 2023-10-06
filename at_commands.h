#ifndef AT_COMMANDS_H
#define AT_COMMANDS_H

#include <string>
#include <map>

struct at_command_spec {
    std::string success = "\nOK";
    std::string error = "\nERROR";
    int timeout = 350;
};

struct at_command_response {
    bool success;
    std::string response;
};

static std::map<std::string, at_command_spec> commands;

#endif // AT_COMMANDS_H
