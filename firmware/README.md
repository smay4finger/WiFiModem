This code is based on Zimodem by Bo Zimmerman. It also contains a patch made by
Hans Huebner to address issuses with Escape sequences.


Building with Arduino IDE
-------------------------

Please use the following settings in the Tools menu:

Board: "Generic ESP8266 Module"
Builtin LED: "2"
Upload Speed: "115200"
CPU Frequency: "80 MHz"
Crystal Frequency: "26 MHz"
Flash Size: "4MB (FS:2MB OTA:~1019KB)"
Flash Mode: "QIO (fast)"
Flash Frequency: "40 MHz"
Reset Method: "no dtr (aka ck)"
Debug port: "Disabled"
Debug Level: "None"
lwIP Variant "v2 Lower Memory
vTables: "Flash"
Exceptions: "Legacy (new can return nullprt)"
Erase FLash: "Only Sketch"
