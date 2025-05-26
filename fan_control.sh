#!/bin/bash

fan=17
led=27
limit=30.0
sensor="/sys/bus/w1/devices/28-*/w1_slave"
data="temp.txt"

# Export GPIO
echo "$fan" > /sys/class/gpio/export 2>/dev/null
echo "$led" > /sys/class/gpio/export 2>/dev/null
echo "out" > /sys/class/gpio/gpio$fan/direction
echo "out" > /sys/class/gpio/gpio$led/direction

# Read temperature
temp_raw=$(cat $sensor | grep "t=" | cut -d "=" -f2)
temp_c=$(echo "scale=2; $temp_raw / 1000" | bc)

# Log temperature
echo "$(date) : temp_c=$temp_c°C" > $data

# Compare and control
if (( $(echo "$temp_c > $limit" | bc -l) )); then
    echo "1" > /sys/class/gpio/gpio$fan/value
    echo "1" > /sys/class/gpio/gpio$led/value
    echo "Fan turned ON (temp=$temp_c°C)" >> $data
else
    echo "0" > /sys/class/gpio/gpio$fan/value
    echo "0" > /sys/class/gpio/gpio$led/value
    echo "Fan turned OFF (temp=$temp_c°C)" >> $data
fi
