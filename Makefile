FQBN=esp8266:esp8266:generic:xtal=80,vt=flash,exception=legacy,ssl=all,ResetMethod=ck,CrystalFreq=26,FlashFreq=40,FlashMode=qio,eesz=4M2M,led=2,ip=lm2f,dbg=Disabled,wipe=none,baud=115200
PORT=/dev/ttyUSB0

all:
	/opt/arduino/arduino-1.8.12/arduino --verify \
		--pref build.path=firmware/build \
		--pref update.check=false \
		--board "$(FQBN)" firmware/firmware.ino

upload:
	/opt/arduino/arduino-1.8.12/arduino --upload \
		--port $(PORT) \
		--pref build.path=firmware/build \
		--pref update.check=false \
		--board "$(FQBN)" firmware/firmware.ino

.PHONE: all upload
