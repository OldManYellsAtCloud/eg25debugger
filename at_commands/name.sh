#!/bin/bash

declare -A at_array

at_array[ATI]="Display MT Identification Information"
at_array[AT+GMI]="Request Manufacturer Identification"
at_array[AT+GMM]="Request Model Identification"
at_array[AT+GMR]="Request TA Firmware Revision Identification"
at_array[AT+CGMI]="Request Manufacturer Identification"
at_array[AT+CGMM]="Request MT Model Identification"
at_array[AT+CGMR]="Request MT Firmware Revision Identification"
at_array[AT+GSN]="Request International Mobile Equipment Identity (IMEI) and SN"
at_array[AT+CGSN]="Request International Mobile Equipment Identity (IMEI)"
at_array[AT&F]="Reset AT Command Settings to Factory Defaults"
at_array[AT&V]="Display Current Configuration"
at_array[AT&W]="Store Current Settings to User-defined Profile"
at_array[ATZ]="Set all Current Parameters to User-defined Profile"
at_array[ATQ]="Set Result Code Presentation Mode"
at_array[ATV]="MT Response Format"
at_array[ATE]="Set Command Echo Mode "
at_array[ATS3]="Set Command Line Termination Character"
at_array[ATS4]="Set Response Formatting Character"
at_array[ATS5]="Set Command Line Editing Character"
at_array[ATX]="Set CONNECT Result Code Format and Monitor Call Progress"
at_array[AT+CFUN]="Set UE Functionality"
at_array[AT+CMEE]="Error Message Format"
at_array[AT+CSCS]="Select TE Character Set"
at_array[AT+QURCCFG]="Configure URC Indication Option"
at_array[AT+QAPRDYIND]="Configure to Report Specified URC"
at_array[AT+QDIAGPORT]="Debug UART Configuration"
at_array[AT&C]="Set DCD Function Mode"
at_array[AT&D]="Set DTR Function Mode"
at_array[AT+IFC]="Set TE-TA Local Data Flow Control"
at_array[AT+ICF]="Set TE-TA Control Character Framing"
at_array[AT+IPR]="Set TE-TA Fixed Local Rate"
at_array[AT+QRIR]="Restore RI Behavior to Inactive"
at_array[AT+CPAS]="Mobile Equipment Activity Status"
at_array[AT+CEER]="Extended Error Report"
at_array[AT+QINDCFG]="URC Indication Configuration"
at_array[AT+QMBNCFG]="MBN File Configuration Setting"
at_array[AT+CIMI]="Request International Mobile Subscriber Identity (IMSI)"
at_array[AT+CLCK]="Facility Lock"
at_array[AT+CPIN]="Enter PIN"
at_array[AT+CPWD]="Change Password"
at_array[AT+CSIM]="Generic (U)SIM Access"
at_array[AT+CRSM]="Restricted (U)SIM Access"
at_array[AT+QCCID]="Show ICCID"
at_array[AT+QPINC]="Display PIN Remainder Counter"
at_array[AT+QINISTAT]="Query Initialization Status of (U)SIM Card"
at_array[AT+QSIMDET]="(U)SIM Card Detection"
at_array[AT+QSIMSTAT]="(U)SIM Card Insertion Status Report"
at_array[AT+QSIMVOL]="Fix (U)SIM Card Supply Voltage"
at_array[AT+CCHO]="Open Logical Channel"
at_array[AT+CGLA]="UICC Logical Channel Access"
at_array[AT+CCHC]="Close Logical Channel"
at_array[AT+COPS]="Operator Selection"
at_array[AT+CREG]="Network Registration Status"
at_array[AT+CSQ]="Signal Quality Report"
at_array[AT+CPOL]="Preferred Operator List"
at_array[AT+COPN]="Read Operator Names"
at_array[AT+CTZU]="Automatic Time Zone Update"
at_array[AT+CTZR]="Time Zone Reporting"
at_array[AT+QLTS]="Obtain the Latest Time Synchronized Through Network"
at_array[AT+QNWINFO]="Query Network Information"
at_array[AT+QSPN]="Display the Name of Registered Network"
at_array[AT+QNETINFO]="Query Network Information of RATs"
at_array[AT+QNWLOCK]="Network Locking Configuration"
at_array[AT+QOPSCFG]="Configure Bands to be Scanned in 2G/3G/4G"
at_array[AT+QOPS]="Band Scan"
at_array[AT+QFPLMNCFG]="FPLMN Configuration"
at_array[AT+QENG]="Switching on/off Engineering Mode"
at_array[AT+CIND]="Command of Control Instructions"
at_array[ATA]="Answer an Incoming Call"
at_array[ATD]="Mobile Originated Call to Dial a Number"
at_array[ATH]="Disconnect Existing Connection"
at_array[AT+CVHU]="Voice Hang up Control"
at_array[AT+CHUP]="Hang up Voice Call"
at_array[+++]="Switch from Data Mode to Command Mode"
at_array[ATO]="Switch from Command Mode to Data Mode"
at_array[ATS0]="Set Number of Rings before Automatical Answering"
at_array[ATS6]="Set Pause before Blind Dialing"
at_array[ATS7]="Set Time to Wait for Connection Completion"
at_array[ATS8]="Set the Time to Wait for Comma Dial Modifier"
at_array[ATS10]="Set Disconnection Delay after Indicating the Absence of Data Carrier"
at_array[ATS12]="Set the Interval for Exiting the Transparent Access Mode Using +++"
at_array[AT+CBST]="Select Bearer Service Type"
at_array[AT+CSTA]="Select Type of Address"
at_array[AT+CLCC]="List Current Calls of ME"
at_array[AT+CR]="Service Reporting Control"
at_array[AT+CRC]="Set Cellular Result Codes for Incoming Call Indication"
at_array[AT+CRLP]="Select Radio Link Protocol Parameter"
at_array[AT+QECCNUM]="Configure Emergency Call Numbers"
at_array[AT+QHUP]="Hang up Call with a Specific Release Cause"
at_array[AT+QCHLDIPMPTY]="Hang Up a Call in the VoLTE Conference"
at_array[AT^DSCI]="Call Status Indication"
at_array[AT+CNUM]="Subscriber Number"
at_array[AT+CPBF]="Find Phonebook Entries"
at_array[AT+CPBR]="Read Phonebook Entries"
at_array[AT+CPBS]="Select Phonebook Memory Storage"
at_array[AT+CPBW]="Write Phonebook Entry"
at_array[AT+CSMS]="Select Message Service"
at_array[AT+CMGF]="Message Format"
at_array[AT+CSCA]="Service Center Address"
at_array[AT+CPMS]="Preferred Message Storage"
at_array[AT+CMGD]="Delete Message"
at_array[AT+CMGL]="List Message"
at_array[AT+CMGR]="Read Message"
at_array[AT+CMGS]="Send Message"
at_array[AT+CMMS]="More Messages to Send"
at_array[AT+CMGW]="Write Message to Memory"
at_array[AT+CMSS]="Send Message from Storage"
at_array[AT+CNMA]="New Message Acknowledgement to UE/TE"
at_array[AT+CNMI]="SMS Event Reporting Configuration"
at_array[AT+CSCB]="Select Cell Broadcast Message Types"
at_array[AT+CSDH]="Show SMS Text Mode Parameters"
at_array[AT+CSMP]="Set SMS Text Mode Parameters"
at_array[AT+QCMGS]="Send Concatenated Messages"
at_array[AT+QCMGR]="Read Concatenated Messages "
at_array[AT+CGATT]="Attachment or Detachment of PS"
at_array[AT+CGDCONT]="Define PDP Context"
at_array[AT+CGQREQ]="Quality of Service Profile (Requested)"
at_array[AT+CGQMIN]="Quality of Service Profile (Minimum Acceptable)"
at_array[AT+CGEQREQ]="UMTS Quality of Service Profile (Requested)"
at_array[AT+CGEQMIN]="UMTS Quality of Service Profile (Minimum Acceptable)"
at_array[AT+CGACT]="Activate or Deactivate PDP Context"
at_array[AT+CGDATA]="Enter Data State"
at_array[AT+CGPADDR]="Show PDP Address"
at_array[AT+CGCLASS]="GPRS Mobile Station Class"
at_array[AT+CGREG]="Network Registration Status"
at_array[AT+CGEREP]="Packet Domain Event Reporting"
at_array[AT+CGSMS]="Select Service for MO SMS Messages"
at_array[AT+CEREG]="EPS Network Registration Status"
at_array[AT+QGDCNT]="Packet Data Counter"
at_array[AT+QAUGDCNT]="Auto Save Packet Data Counter"
at_array[AT\$QCRMCALL]="Start or Stop an RmNet Call"
at_array[AT+QNETDEVSTATUS]="Query RmNet Device Status"
at_array[AT+CGCONTRDP]="PDP Context Read Dynamic Parameters"

at_array[AT+CCFC]="Call Forwarding Number and Conditions Control"
at_array[AT+CCWA]="Call Waiting Control"
at_array[AT+CHLD]="Call Related Supplementary Services"
at_array[AT+CLIP]="Calling Line Identification Presentation"
at_array[AT+CLIR]="Calling Line Identification Restriction"
at_array[AT+COLP]="Connected Line Identification Presentation"
at_array[AT+CSSN]="Supplementary Service Notifications"
at_array[AT+CUSD]="Unstructured Supplementary Service Data"

at_array[AT+CLVL]="Loudspeaker Volume Level Selection"
at_array[AT+CMUT]="Mute Control"
at_array[AT+QAUDLOOP]="Enable/Disable Audio Loop Test"
at_array[AT+VTS]="DTMF and Tone Generation"
at_array[AT+VTD]="Set Tone Duration"
at_array[AT+QAUDMOD]="Set Audio Mode"
at_array[AT+QDAI]="Digital Audio Interface Configuration"
at_array[AT+QEEC]="Set Echo Cancellation Parameters"
at_array[AT+QSIDET]="Set the Side Tone Gain in Current Mode"
at_array[AT+QMIC]="Set Uplink Gains of Microphone"
at_array[AT+QRXGAIN]="Set Downlink Gains of RX"
at_array[AT+QIIC]="Read and Write Codec via IIC"
at_array[AT+QTONEDET]="Enable/Disable DTMF Detection"
at_array[AT+QLDTMF]="Play Local DTMF"
at_array[AT+QWDTMF]="Play or Send DTMF Files to Far End"
at_array[AT+QLTONE]="Play a Local Customized Tone"
at_array[AT+QAUDRD]="Record Media File"
at_array[AT+QPSND]="Play WAV File"
at_array[AT+QTTS]="Play Text"
at_array[AT+QTTSETUP]="Set TTS"
at_array[AT+QWTTS]="Play Text or Send Text To Far End"
at_array[AT+QAUDCFG]="Query and Configure Audio Tuning Process"
at_array[AT+QAUDPLAY]="Play Media File"
at_array[AT+QAUDPLAYGAIN]="Set Audio Playing Gain"
at_array[AT+QAUDRDGAIN]="Set Audio Recording Gain"
at_array[AT+QACDBLOAD]="Write ACDB File"
at_array[AT+QACDBREAD]="Read ACDB File"
at_array[AT+QACDBDEL]="Delete ACDB File"

at_array[AT+QPOWD]="Power off"
at_array[AT+CCLK]="Clock"
at_array[AT+CBC]="Battery Charge"
at_array[AT+QADC]="Read ADC Value"
at_array[AT+QSCLK]="Enable/Disable Low Power Mode"


for i in `ls ./*/*`; do
  echo cmd: `basename $i`, name: ${at_array[`basename $i`]}
  echo Name: ${at_array[`basename $i`]} >> $i
done
