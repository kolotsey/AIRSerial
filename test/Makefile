

TARGET=test-airserial
MAIN=Test.as
PASS=12345

SRC=./
LDFLAGS=\
+configname=air \
-compiler.debug \
-static-link-runtime-shared-libraries=true \
-omit-trace-statements=false \
-default-size=800,600 \
-default-frame-rate=20 \
-library-path+=/opt/flex/frameworks/libs/ \
-library-path+=/opt/flex/frameworks/libs/air/ \
-library-path+=./controls.swc \
-library-path+=../AIRSerial.swc \
-swf-version=10 \
-target-player=10.0.0


SOURCES=$(shell find $(SRC) 2>/dev/null |grep '\.as$$' 2>/dev/null)
SRCDIRS=$(shell echo "$(SRC)" |sed 's/ /,/g')

all:$(TARGET).swf $(TARGET)-appdesc.xml
	/opt/flex/bin/adl $(TARGET)-appdesc.xml

$(TARGET).swf:$(SOURCES) Makefile
	/opt/flex/bin/mxmlc $(LDFLAGS) -o $@ -source-path=$(SRCDIRS) $(MAIN)

clean:
	rm -f $(TARGET).swf $(TARGET).swf.cache
