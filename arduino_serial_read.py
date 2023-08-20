import serial

# Create a serial connection
ser = serial.Serial('/dev/ttyUSB0', 9600)  # adjust with your port and baud rate

def read_from_arduino():
    while True:
        if ser.in_waiting > 0:
            line = ser.readline().decode('utf-8').rstrip()  # read a '\n' terminated line
            print(line)

if __name__ == "__main__":
    read_from_arduino()

