#!/usr/bin/env bash
while [[ "$(pidof polybar)" ]]
do
	pkill polybar
	sleep 1
done
BARS=(top)
for BAR in ${BARS[*]}
do
	nohup polybar $BAR > /dev/null &
done
