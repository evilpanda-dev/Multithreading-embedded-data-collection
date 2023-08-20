import serial
import time
from grove.adc import ADC
from grove.gpio import GPIO
import Adafruit_BMP.BMP085 as BMP085
import threading

stop_threads = False

# First program
def read_from_arduino():
    global stop_threads
    ser = serial.Serial('/dev/ttyUSB1', 9600)
    while not stop_threads:
        if ser.in_waiting > 0:
            line = ser.readline().decode('utf-8').rstrip()
            print(line)

# Second program
class GroveGasSensorMQ2:
    def __init__(self, channel):
        self.channel = channel
        self.adc = ADC()

    @property
    def value(self):
        return self.adc.read(self.channel)

def gas_sensor():
    global stop_threads
    sensor = GroveGasSensorMQ2(4)
    print('Detecting gas...')
    while not stop_threads:
        print('Gas concentration ADC value: {}'.format(sensor.value))

# Third program
usleep = lambda x: time.sleep(x / 1000000.0)
_TIMEOUT1 = 1000
_TIMEOUT2 = 10000

class GroveUltrasonicRanger(object):
    def __init__(self, pin):
        self.dio = GPIO(pin)

    def _get_distance(self):
        self.dio.dir(GPIO.OUT)
        self.dio.write(0)
        usleep(2)
        self.dio.write(1)
        usleep(10)
        self.dio.write(0)

        self.dio.dir(GPIO.IN)

        t0 = time.time()
        count = 0
        while count < _TIMEOUT1:
            if self.dio.read():
                break
            count += 1
        if count >= _TIMEOUT1:
            return None

        t1 = time.time()
        count = 0
        while count < _TIMEOUT2:
            if not self.dio.read():
                break
            count += 1
        if count >= _TIMEOUT2:
            return None

        t2 = time.time()

        dt = int((t1 - t0) * 1000000)
        if dt > 530:
            return None

        distance = ((t2 - t1) * 1000000 / 29 / 2)    # cm

        return distance

    def get_distance(self):
        while True:
            dist = self._get_distance()
            if dist:
                return dist

def ultrasonic_ranger():
    global stop_threads
    sonar = GroveUltrasonicRanger(5)
    print('Detecting distance...')
    while not stop_threads:
        print('Distance: {:.2f} cm'.format(sonar.get_distance()))

# Fourth program
def bmp_sensor():
    global stop_threads
    sensor = BMP085.BMP085()
    while not stop_threads:
        #print('Temperature = {0:0.2f} *C'.format(sensor.read_temperature()))
        print('Pressure = {0:0.2f} Pa'.format(sensor.read_pressure()))
        print('Altitude = {0:0.2f} m'.format(sensor.read_altitude()))
        print('Sealevel Pressure = {0:0.2f} Pa'.format(sensor.read_sealevel_pressure()))

if __name__ == '__main__':
    t1 = threading.Thread(target=read_from_arduino)
    t2 = threading.Thread(target=gas_sensor)
    t3 = threading.Thread(target=ultrasonic_ranger)
    t4 = threading.Thread(target=bmp_sensor)

    t1.start()
    t2.start()
    t3.start()
    t4.start()

    try:
        while True:
            time.sleep(1)
    except KeyboardInterrupt:
        stop_threads = True
        t1.join()
        t2.join()
        t3.join()
        t4.join()

