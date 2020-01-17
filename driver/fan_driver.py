#!/usr/bin/env python
import time

import RPi.GPIO as GPIO

GPIO.setmode(GPIO.BOARD)
GPIO.setwarnings(False)
ON = 0
OFF = 1
FAN_GPIO = 7
GPIO.setup(FAN_GPIO, GPIO.OUT)


def main():
    while True:
        cpu_temp_raw = 0
        with open('/sys/class/thermal/thermal_zone0/temp') as f:
            cpu_temp_raw = f.read()
        cpu_temp = round(float(cpu_temp_raw) / 1000, 1)
        print(cpu_temp)
        if cpu_temp >= 50.0:
            GPIO.output(FAN_GPIO, ON)

        if cpu_temp <= 45.0:
            GPIO.output(FAN_GPIO, OFF)

        time.sleep(10)


if __name__ == "__main__":
    try:
        main()
    except Error as e:
        print(e)
        GPIO.cleanup()
