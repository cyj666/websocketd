#!/bin/bash

# Copyright 2013 Jeroen Janssens
# All rights reserved.
# Use of this source code is governed by a BSD-style
# license that can be found in the LICENSE file.

# Run a simple chat server: websocketd --devconsole --port 8080 ./chat.sh
echo "Please enter your name:"; read USER
echo "[$(date)] ${USER} joined the chat" >> chat.log
echo "[$(date)] Welcome to the chat ${USER}!"
tail -n 0 -f chat.log | grep --line-buffered -v "] ${USER}>" &
while read MSG; do echo "[$(date)] ${USER}> ${MSG}" >> chat.log; done
