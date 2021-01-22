FQBN=esp8266:esp8266:generic:xtal=80,ResetMethod=ck,CrystalFreq=26,FlashFreq=40,FlashMode=qio,eesz=4M2M,led=2,baud=115200
PORT=/dev/ttyUSB0

ESP8266_CORE_VERSION = 2.7.4

ARDUINO_CLI=arduino-cli
ARDUINO_CLI_OPTIONS=--config-file arduino-cli.yaml
ARDUINO_CLI_CFLAGS=--fqbn $(FQBN)

all: firmware/build/firmware.ino.bin

upload: firmware/build/firmware.ino.bin
	-$(ARDUINO_CLI) $(ARDUINO_CLI_OPTIONS) core install esp8266:esp8266@$(ESP8266_CORE_VERSION)
	$(ARDUINO_CLI) $(ARDUINO_CLI_OPTIONS) upload $(ARDUINO_CLI_CFLAGS) --input-dir firmware/build --port $(PORT) firmware

clean:
	$(RM) -r firmware/build

distclean: clean
	$(RM) -r .arduino15

firmware/build/firmware.ino.bin: $(wildcard firmware/*.ino firmware/*.h)
	-$(ARDUINO_CLI) $(ARDUINO_CLI_OPTIONS) core install esp8266:esp8266@$(ESP8266_CORE_VERSION)
	$(ARDUINO_CLI) $(ARDUINO_CLI_OPTIONS) compile $(ARDUINO_CLI_CFLAGS) --output-dir firmware/build firmware

.PHONE: all clean upload
