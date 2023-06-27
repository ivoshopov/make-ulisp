
makefile_dir:=$(realpath $(dir $(lastword $(MAKEFILE_LIST))))

ESP_DIR = $(makefile_dir)/esp8266

CPP_EXTRA += -I$(ESP_DIR)/libraries/ESP8266SdFat/src/
CPP_EXTRA += -I$(ESP_DIR)/libraries/SPI/
CPP_EXTRA += -I$(ESP_DIR)/libraries/ESP8266WiFi/src/
CPP_EXTRA += -I$(ESP_DIR)/libraries/SDFS/src/
CPP_EXTRA += -I$(ESP_DIR)/libraries/Wire/
CPP_EXTRA += -I$(ESP_DIR)/libraries/EEPROM/

MAKE = make -C ulisp-esp \
	-f $(makefile_dir)/makeEspArduino/makeEspArduino.mk \
	ESP_ROOT=$(ESP_DIR) \
	SKETCH=ulisp-esp.ino \
	CPP_EXTRA="$(CPP_EXTRA)"

$(MAKECMDGOALS) all: default
        @:

.PHONY: default
default:
	$(MAKE) $(MAKECMDGOALS)

.tools-setup: $(ESP_DIR)/tools/get.py
	cd $(ESP_DIR)/tools/ && ./get.py
	touch $@

$(ESP_DIR)/tools/get.py:
	git submodule update --init --recursive
