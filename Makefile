# Copyright 2011 Sergey Kolotsey.
#
# This file is part of AIRSerial library.
#
# AIRSerial is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# AIRSerial is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public Licenise
# along with libexpression. If not, see <http://www.gnu.org/licenses/>.

# Set global path of your flex directory here
FLEXDIR=/opt/flex

TARGET=AIRSerial.swc
SRCDIR=./src
INCLUDECLASS=ws.equator.proto.Serial,ws.equator.proto.WAKE
SOURCES=$(shell find 2>/dev/null |grep '\.as$$' 2>/dev/null)

CFLAGS= \
	+configname=air \
	-compiler.source-path=$(SRCDIR) \
	-include-classes=$(INCLUDECLASS) \
	-static-link-runtime-shared-libraries=true \
	-strict=true \
	-show-actionscript-warnings=true \
	-show-binding-warnings=true \
	-show-invalid-css-property-warnings=true \
	-show-shadowed-device-font-warnings=true \
	-show-unused-type-selector-warnings=true \
	-debug=false \
	-omit-trace-statements=true \
	-optimize=true \
	-swf-version=10 \
	-target-player=10.0.0


all:$(TARGET)

$(TARGET):$(SOURCES) Makefile
	$(FLEXDIR)/bin/compc $(CFLAGS) -output $@

clean:
	rm -f $(TARGET)
