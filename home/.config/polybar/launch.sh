#!/usr/bin/env bash

polybar-msg cmd quit

echo "---" | tee -a /tmp/polybar1.log
polybar bar1 2>&1

echo "Bars launched..."
