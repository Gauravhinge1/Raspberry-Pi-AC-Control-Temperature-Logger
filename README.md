# Raspberry Pi Smart Fan Controller & Temperature Logger 🌡️🌀📊

This embedded Linux project for Raspberry Pi uses a DS18B20 temperature sensor to control a fan like a basic AC system. It maintains temperature by switching the fan ON/OFF based on a set threshold. Additionally, it **logs temperature and fan status data** to a file (`temp.txt`) for monitoring and record-keeping.

## Features

- Reads temperature from DS18B20 sensor
- Controls GPIO-connected fan and LED indicator
- Maintains temperature by toggling fan ON/OFF around set limit
- **Logs temperature readings and fan state changes with timestamps**
- Simple Bash script with easy setup

## Hardware Requirements

- Raspberry Pi (any model with GPIO)
- DS18B20 temperature sensor
- 4.7k ohm resistor (for sensor)
- Cooling fan (or any DC load)
- NPN transistor (e.g., 2N2222 or BC547 for fan)
- LED and resistor (optional for indicator)
- Breadboard and jumper wires

## Files

- `fan_control.sh` – Main control script
- `temp.txt` – Auto-generated temperature log file
- `README.md` – This documentation
- `LICENSE` – MIT Open-source license

## How to Use

1. Enable the 1-Wire interface on your Pi (`sudo raspi-config` → Interfacing Options → 1-Wire → Enable)
2. Connect the DS18B20 sensor data pin to GPIO4 (default for w1 devices)
3. Make the script executable:
   ```bash
   chmod +x fan_control.sh
