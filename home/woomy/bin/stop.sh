#!/bin/bash
echo "Stopping..."
dbus-send --system --print-reply    \
                --dest="org.freedesktop.ConsoleKit" \
                /org/freedesktop/ConsoleKit/Manager   \
                org.freedesktop.ConsoleKit.Manager.Stop
