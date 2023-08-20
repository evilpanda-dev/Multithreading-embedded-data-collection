import os
import time
import serial
from datetime import datetime
from grove.adc import ADC
from grove.gpio import GPIO
import Adafruit_BMP.BMP085 as BMP085
import threading
import ctypes
import matplotlib.pyplot as plt
import matplotlib.animation as animation
import numpy as np

cond_var = threading.Condition()
stop_threads = False
buffer = {} # shared buffer
buffer_lock = threading.Lock()  # new buffer lock

baudrate = 500000
serial_port = "/dev/ttyUSB1"
ser = None
LIGHT_THRESHOLD = 150
GAS_THRESHOLD = 100

timing_data = {
    'read_from_arduino': [],
    'write_temp_to_buffer': [],
    'write_hum_to_buffer': [],
    'write_light_to_buffer': [],
    'write_sound_to_buffer': [],
    'read_gas_sensor': [],
    'write_gas_to_buffer': [],
    'read_distance_sensor': [],
    'write_distance_to_buffer': [],
    'read_pressure_sensor': [],
    'write_pressure_to_buffer': [],
    'read_altitude_sensor': [],
    'write_altitude_to_buffer': [],
    'read_sealevel_pressure_sensor': [],
    'write_sealevel_pressure_to_buffer': [],
    'write_buffer_to_lcd': [],
}

# First program
def read_from_arduino():
    global stop_threads,ser
    while not stop_threads:
        with cond_var:
            if ser.in_waiting > 0:
                start_time = time.time()
                line = ser.readline().decode('utf-8').rstrip()
                read_time = time.time() - start_time
                # print("Time to read from Arduino: %s seconds" % read_time)
                timing_data['read_from_arduino'].append(read_time)
                if 'Temperature' in line:
                    temp_val = line.split(': ')[-1].split()[0]
                    start_time = time.time()
                    with buffer_lock:  # lock the buffer before updating it
                        buffer['Temperature'] = temp_val
                    write_time = time.time() - start_time
                    # print("Time to write temperature to buffer: %s seconds" % write_time)
                    timing_data['write_temp_to_buffer'].append(write_time)
                elif 'Humidity' in line:
                    hum_val = line.split(': ')[-1].split()[0]
                    start_time = time.time()
                    with buffer_lock:  # lock the buffer before updating it
                        buffer['Humidity'] = hum_val
                    write_time = time.time() - start_time
                    # print("Time to write humidity to buffer: %s seconds" % write_time)
                    timing_data['write_hum_to_buffer'].append(write_time)
                elif 'Light level' in line:
                    light_val = line.split(': ')[-1]
                    start_time = time.time()
                    with buffer_lock:  # lock the buffer before updating it
                        buffer['Light level'] = light_val
                    write_time = time.time() - start_time
                    # print("Time to write light level to buffer: %s seconds" % write_time)
                    timing_data['write_light_to_buffer'].append(write_time)

                    # If the light level is below the threshold, turn on the LED
                    if light_val < LIGHT_THRESHOLD:
                        ser.write(b'LED_ON\n')
                    else:
                        ser.write(b'LED_OFF\n')

                elif 'Sound level' in line:
                    sound_val = line.split(': ')[-1]
                    start_time = time.time()
                    with buffer_lock:  # lock the buffer before updating it
                        buffer['Sound level'] = sound_val
                    write_time = time.time() - start_time
                    # print("Time to write sound level to buffer: %s seconds" % write_time)
                    timing_data['write_sound_to_buffer'].append(write_time)
                cond_var.notify_all()
            cond_var.wait(timeout=1)

# Second program
class GroveGasSensorMQ2:
    def __init__(self, channel):
        self.channel = channel
        self.adc = ADC()

    @property
    def value(self):
        return self.adc.read(self.channel)

def gas_sensor():
    global stop_threads,ser
    sensor = GroveGasSensorMQ2(4)
    last_value = None
    while not stop_threads:
        with cond_var:
            start_time = time.time()
            current_value = sensor.value
            read_time = time.time() - start_time
            # print("Time to read gas sensor: %s seconds" % read_time)
            timing_data['read_gas_sensor'].append(read_time)
            if current_value != last_value:
                start_time = time.time()
                with buffer_lock:  # lock the buffer before updating it
                    buffer['Gas'] = current_value
                write_time = time.time() - start_time
                # print("Time to write gas value to buffer: %s seconds" % write_time)
                timing_data['write_gas_to_buffer'].append(write_time)
                if current_value > GAS_THRESHOLD:
                    ser.write(b'BUZZER_ON\n')
                else:
                    ser.write(b'BUZZER_OFF\n')
            last_value = current_value
            cond_var.notify_all()
        time.sleep(1)

# Third program
usleep = lambda x: time.sleep(x/1000000.0)
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
        usleep(1)
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
    global stop_threads,ser
    sensor = GroveUltrasonicRanger(5)
    last_distance = None
    while not stop_threads:
        with cond_var:
            start_time = time.time()
            current_distance = sensor.get_distance()
            read_time = time.time() - start_time
            # print("Time to read distance sensor: %s seconds" % read_time)
            timing_data['read_distance_sensor'].append(read_time)
            if current_distance != last_distance:
                start_time = time.time()
                with buffer_lock:  # lock the buffer before updating it
                    buffer['Distance'] = current_distance
                write_time = time.time() - start_time
                # print("Time to write distance to buffer: %s seconds" % write_time)
                timing_data['write_distance_to_buffer'].append(write_time)
            last_distance = current_distance
            cond_var.notify_all()
        time.sleep(1)

# Fourth program
def bmp_sensor():
    global stop_threads,ser
    sensor = BMP085.BMP085()
    last_pressure = None
    last_altitude = None
    last_sealevel_pressure = None
    while not stop_threads:
        with cond_var:
            # Read and record Pressure
            start_time = time.time()
            pressure = sensor.read_pressure()
            read_time = time.time() - start_time
            # print("Time to read pressure sensor: %s seconds" % read_time)
            timing_data['read_pressure_sensor'].append(read_time)
            if pressure != last_pressure:
                start_time = time.time()
                with buffer_lock:  # lock the buffer before updating it
                    buffer['Pressure'] = pressure
                write_time = time.time() - start_time
                # print("Time to write pressure to buffer: %s seconds" % write_time)
                timing_data['write_pressure_to_buffer'].append(write_time)
                last_pressure = pressure
            
            # Read and record Altitude
            start_time = time.time()
            altitude = sensor.read_altitude()
            read_time = time.time() - start_time
            # print("Time to read altitude sensor: %s seconds" % read_time)
            timing_data['read_altitude_sensor'].append(read_time)
            if altitude != last_altitude:
                start_time = time.time()
                with buffer_lock:  # lock the buffer before updating it
                    buffer['Altitude'] = altitude
                write_time = time.time() - start_time
                # print("Time to write altitude to buffer: %s seconds" % write_time)
                timing_data['write_altitude_to_buffer'].append(write_time)
                last_altitude = altitude
            
            # Read and record Sealevel-pressure
            start_time = time.time()
            sealevel_pressure = sensor.read_sealevel_pressure()
            read_time = time.time() - start_time
            # print("Time to read sealevel pressure sensor: %s seconds" % read_time)
            timing_data['read_sealevel_pressure_sensor'].append(read_time)
            if sealevel_pressure != last_sealevel_pressure:
                start_time = time.time()
                with buffer_lock:  # lock the buffer before updating it
                    buffer['Sealevel-pressure'] = sealevel_pressure
                write_time = time.time() - start_time
                # print("Time to write sealevel pressure to buffer: %s seconds" % write_time)
                timing_data['write_sealevel_pressure_to_buffer'].append(write_time)
                last_sealevel_pressure = sealevel_pressure
                
            cond_var.notify_all()
            cond_var.wait(timeout=1)


# Load the shared library
libsensor = ctypes.CDLL('./vt100_commands.so')

# Specify the argument types and return type of the function
libsensor.write_sensor_data.argtypes = [ctypes.c_float] * 9
libsensor.write_sensor_data.restype = None

def write_buffer_to_lcd(buffer):
    while not stop_threads:
        with buffer_lock:
            if all(key in buffer for key in keys):  # Make sure all keys are in the buffer
                start_time = time.time()  # start time
                try:
                    libsensor.write_sensor_data(
                        float(buffer.get('Temperature', 0)),
                        float(buffer.get('Humidity', 0)),
                        float(buffer.get('Light level', 0)),
                        float(buffer.get('Sound level', 0)),
                        float(buffer.get('Gas', 0)),
                        float(buffer.get('Distance', 0)),
                        float(buffer.get('Pressure', 0)),
                        float(buffer.get('Altitude', 0)),
                        float(buffer.get('Sealevel-pressure', 0))  
                    )
                    write_time = time.time() - start_time
                    # print("Time to write buffer to LCD: %s seconds" % write_time)
                    timing_data['write_buffer_to_lcd'].append(write_time)
                except Exception as e:
                    print('Error writing to LCD:', e)
        time.sleep(1)

# Control Monitoring thread
def control_monitoring():
    global stop_threads, t1, t2, t3, t4, t_lcd
    while not stop_threads:
        if not t1.is_alive():
            print("Thread 1 is not running. Restarting...")
            t1 = threading.Thread(target=read_from_arduino)
            t1.start()

        if not t2.is_alive():
            print("Thread 2 is not running. Restarting...")
            t2 = threading.Thread(target=gas_sensor)
            t2.start()

        if not t3.is_alive():
            print("Thread 3 is not running. Restarting...")
            t3 = threading.Thread(target=ultrasonic_ranger)
            t3.start()

        if not t4.is_alive():
            print("Thread 4 is not running. Restarting...")
            t4 = threading.Thread(target=bmp_sensor)
            t4.start()

        if not t_lcd.is_alive():
            print("LCD thread is not running. Restarting...")
            t_lcd = threading.Thread(target=write_buffer_to_lcd, args=(buffer,))
            t_lcd.start()

        time.sleep(1)

if __name__ == '__main__':
    # Initialize keys in the buffer
    keys = ['Temperature', 'Humidity', 'Light level', 'Sound level', 'Gas', 'Distance', 'Pressure', 'Altitude', 'Sealevel-pressure']
    for key in keys:
        buffer[key] = 0
    ser = serial.Serial('/dev/ttyUSB0', 9600)
    t1 = threading.Thread(target=read_from_arduino)
    t2 = threading.Thread(target=gas_sensor)
    t3 = threading.Thread(target=ultrasonic_ranger)
    t4 = threading.Thread(target=bmp_sensor)
    t_lcd = threading.Thread(target=write_buffer_to_lcd, args=(buffer,))
    t_control = threading.Thread(target=control_monitoring)

    t1.start()
    t2.start()
    t3.start()
    t4.start()
    t_lcd.start()
    t_control.start()


    # Create two figures
    fig_read = plt.figure()
    fig_write = plt.figure()

    # Separate data
    read_data = {k: v for k, v in timing_data.items() if k.startswith('read')}
    write_data = {k: v for k, v in timing_data.items() if k.startswith('write')}

    # Creating a subplot for each measurement
    read_subplots = {measurement: fig_read.add_subplot(len(read_data), 1, i+1) 
                     for i, measurement in enumerate(read_data.keys())}
    write_subplots = {measurement: fig_write.add_subplot(len(write_data), 1, i+1) 
                      for i, measurement in enumerate(write_data.keys())}

    read_lines = {measurement: subplot.plot([])[0] 
                  for measurement, subplot in read_subplots.items()}  # Store the line objects
    write_lines = {measurement: subplot.plot([])[0] 
                   for measurement, subplot in write_subplots.items()}  # Store the line objects
    
    # Update function for the graphs
    def update_graphs(i):
        for measurement, subplot in read_subplots.items():
            read_lines[measurement].set_ydata(read_data[measurement])
            read_lines[measurement].set_xdata(range(len(read_data[measurement])))
            subplot.relim()
            subplot.autoscale_view()
            subplot.set_title(measurement)
    
        for measurement, subplot in write_subplots.items():
            write_lines[measurement].set_ydata(write_data[measurement])
            write_lines[measurement].set_xdata(range(len(write_data[measurement])))
            subplot.relim()
            subplot.autoscale_view()
            subplot.set_title(measurement)

    # Create animations for both figures
    ani_read = animation.FuncAnimation(fig_read, update_graphs, interval=1000)
    ani_write = animation.FuncAnimation(fig_write, update_graphs, interval=1000)

    plt.show()




    try:
        while True:
            time.sleep(1)
    except KeyboardInterrupt:
        stop_threads = True
        ser.write(b'LED_OFF\n')    # Turn off LED when stopping the program
        ser.write(b'BUZZER_OFF\n') # Turn off Buzzer when stopping the program
        t1.join()
        t2.join()
        t3.join()
        t4.join()
        t_lcd.join()
        t_control.join()
        ser.close()  # Close the serial port

