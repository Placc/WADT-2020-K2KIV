#!/bin/bash

export KIVHOME=$(dirname $(readlink -f "$0"))
JAVA_TOOL_OPTIONS='-Dfile.encoding=UTF8'
java -jar "$KIVHOME/k2kiv.jar"
