#!/usr/bin/env bash

inotifywait -r -m -e modify $PWD | 
   while read path _ file; do 
       echo $path$file modified, restarting polybar
       $PWD/launch.sh
   done

