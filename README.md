
AIRSerial - SWC Library to Access Serial Ports From AIR Applications
====================================================================

OVERVIEW
========
  This SWC library allows to create AIR/Flex application that can access serial
  ports. The library currently supports Linux and Windows hosts and was tested
  in Ubuntu (x86 and x86_64) and on Windows 7 (x86)
  
  The library provides direct access to a serial port. It is possible to access
  any serial device by implementing required serial protocols.
  
  The library also provides a simple serial protocol WAKE. It is easier to
  implement communication between two machines using this protocol and serial
  ports.
  
  The library spawns native application in background to access serial ports.
  The binary code of the native applications is included into library. The
  required program (Linux or Windows binary) is extracted into temporary folder
  when library is loaded. The native program is then run in background to access
  serial port.

REQUIREMENTS
============
  This library does not require any extra packages.

INSTALLATION INSTRUCTIONS
=========================
  To use this library in your project simply add a folder containing the library
  into your Lib path (option -library-path+=../AIRSerial.swc for flex).

DOCUMENTATION
=============
  Only in-code comments are available at the moment.
  See also usage example below.
  
DIRECTORY STRUCTURE
===================
  Directory `io-serial' contains source code of a native application that is used
  by AIRSerial library to access serial ports (Windows and Linux).
  
  Directory `src' contains source code of the library.
  
  Directory `test' contains a source code of a simple test AIR application that
  uses the library.

EXAMPLE
=======
    //Enumerate all serial ports available on a host machine:
  
    Serial.enum( function( success:Boolean, list:Array):void{
        if( !success){
            trace( "Could not enumerate serial ports");
        }else{
            if( list.length==0){
                trace("There are no serial ports in the system);
            }else{
                for( var i:int=0; i&lt;list.length; i++){
                    trace( list[i]);
                }
            }
        }
    });
    
    //TODO: add examples

COPYRIGHT NOTICE
================
  AIRSerial is free software: you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation, either version 3 of the License, or
  (at your option) any later version.

  AIRSerial is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.

  You should have received a copy of the GNU General Public Licenise
  along with libexpression. If not, see <http://www.gnu.org/licenses/>.
