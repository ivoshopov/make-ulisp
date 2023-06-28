# make-ulisp
Simple build system for ulisp by David Johnson-Davies

https://github.com/technoblogy/ulisp-esp

Currently build system support only ESP8266. The ulisp was tested on NODEMCU_DEVKIT_V1.0 https://github.com/nodemcu/nodemcu-devkit-v1.0/blob/master/NODEMCU_DEVKIT_V1.0.PDF

## Build ulisp
There is a Makefile that inherit all target from makeEspArduino. By default calling the make should checkout all dependency and build the ulisp.

    make

In order to flash the image on a target (NodeMCU) just execute:

    make flash
