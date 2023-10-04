#ifndef AT_COMMANDS_H
#define AT_COMMANDS_H

#include <string>

struct at_command {
    std::string exec_command;
    std::string test_command;
    std::string write_command;
    std::string description;
    bool exec_args;
    bool test_args;
    bool write_args;
};

at_command at_commands[] = {
    {
        "ATI",
        "",
        "",
        "Display Product Identification Information",
        false,
        false,
        false
    },
    {
        "AT+GMI",
        "AT+GMI=?",
        "",
        "Request Manufacturer Idnetification - same as AT+CGMI",
        false,
        false,
        false
    },
    {
        "AT+GMM",
        "AT+GMM=?",
        "",
        "Request TA Model identification - same at AT+CGMM",
        false,
        false,
        false
    },
    {
        "AT+GMR",
        "AT+GMR=?"
        "",
        "Request TA Firmware Revision Identification - same as AT-CGMR",
        false,
        false,
        false
    },
    {
        "AT+CGMI",
        "AT+CGMI=?"
        "",
        "Request Manufacturer Identification - same as AT+GMI",
        false,
        false,
        false
    },
    {
        "AT+CGMM",
        "AT+CGMM=?"
        "",
        "Request Model Identification - same as AT+GMM",
        false,
        false,
        false
    },
    {
        "AT+CGMR",
        "AT+CGMR=?"
        "",
        "Request MT Firmware Revision Identification - same as AT+GMR",
        false,
        false,
        false
    },
    {
        "AT+GSN",
        "AT+GSN=?",
        "AT+GSN=",
        "Request International Mobile Equipment Identity (IMEI) and SN - same as AT+CGSN. If write parameter is '0', it returns serial number. If write parameter is '1', it returns IMEI.",
        false,
        false,
        true
    },
    {
        "AT+CGSN",
        "AT+CGSN=?",
        "AT+CGSN=",
        "Request International Mobile Equipment Identity (IMEI) and SN - same as AT+GSN. If write parameter is '0', it returns serial number. If write parameter is '1', it returns IMEI.",
        false,
        false,
        true
    },
    {
        "AT&F",
        "",
        "",
        "Set all Current Parameters to Manufacturer Defaults. The argument is an integer (0). Possibly profile ID?",
        true,
        false,
        false
    },
    {
        "AT&V",
        "",
        "",
        "Display Current Configuration",
        false,
        false,
        false
    },
    {
        "AT&W",
        "",
        "",
        "Store Current Settings to User-defined Profile. The parameter is an integer (0), profile number.",
        true,
        false,
        false
    },
    {
        "ATZ",
        "",
        "",
        "Set all Current Parameters to User-defined Profile - First reset to factory default, then store to profile id. Parameter is an integer (0), profile ID.",
        true,
        false,
        false
    },
    {
        "ATQ",
        "",
        "",
        "Set Result Code Presentation Mode. If parameter is 0, command result (OK/ERROR) is echoed. If 1, result is suppressed.",
        true,
        false,
        false
    },
    {
        "ATV",
        "",
        "",
        "MT Response Format - Set command response format. When parameter is 0, the response is numeric(0=OK, 1=CONNECT, 2=RING, 3=NO CARRIER, 4=ERROR, 6=NO DIALTONE, 7=BUSY, 8=NO ANSWER. There is no 5.). When the parameter is 1, it remains string.",
        true, false, false
    },
    {
        "ATE",
        "",
        "",
        "Set Command Echo Mode. When paremeter is 0, echo mode is OFF. When 1, echo mode is ON.",
        true, false, false
    },
    {
        "A/",
        "",
        "",
        "Repeat Previous Command Line",
        false, false, false
    },
    {
        "ATS3=",
        "ATS3?",
        "",
        "Set Command Line Termination Character. Parameter is an integer, between 0-127. Default is 13. Note: is it broken? Seems to error out.",
        true, false, false
    },
    {
        "ATS4=",
        "ATS4?",
        "",
        "Set Response Formatting Character. Parameter is an integer, between 0-127. Default is 10. Note: is it broken? Seems to error out.",
        true, false, false
    },
    {
        "ATS5=",
        "ATS5?",
        "",
        "Set Command Line Editing Character (backspace character). Parameter is an integer, between 0-127. Default is 8. Note: is it broken? Seems to error out.",
        true, false, false
    },

};

#endif // AT_COMMANDS_H
