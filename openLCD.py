import os
import time
import serial
from datetime import datetime

baudrate = 500000
serial_port = "/dev/ttyUSB0"

def diskSpace(path):
    statvfs = os.statvfs(path)
    disk_size = statvfs.f_blocks * statvfs.f_frsize
    free = statvfs.f_bfree * statvfs.f_frsize
    used = disk_size - free
    return {"disk_size": disk_size, "free": free, "used": used}

def cpuCount():
    with open("/proc/stat", "r") as f:
        lines = f.readlines()
    return len([l for l in lines if l.startswith("cpu")]) - 1  # excluding the first line "cpu"

def systemInfo(usbdev):
    t = time.time()
    date_time = datetime.fromtimestamp(t).strftime("%a %b %d %H:%M:%S %Y\n")
    usbdev.write(date_time.encode())
    usbdev.flush()
    time.sleep(0.3)

    uname = os.uname()
    usbdev.write("OS: {}\n".format(uname[0]).encode()) 
    usbdev.flush()
    time.sleep(0.3)
    
    usbdev.write("Version: {}\n".format(uname[2]).encode())
    usbdev.flush()
    time.sleep(0.3)
    
    usbdev.write("Machine: {}\n".format(uname[4]).encode())
    usbdev.flush()

def main():
    usbdev = serial.Serial(serial_port, baudrate)
    
    GB = 1024*1024*1024
    diskData = diskSpace("/")
    diskData["disk_size"] /= GB
    diskData["used"] /= GB
    diskData["free"] /= GB

    cpus = cpuCount()

    while True:
        usbdev.write("\x1b[H".encode())  # Move cursor to home position
        usbdev.flush()
        time.sleep(0.1)
        systemInfo(usbdev)
        usbdev.flush()
        time.sleep(0.1)
        
        # TODO: Add your CPU usage computation and other functionality here

        usbdev.write("sda1\n disk_size: {}GB\n".format(diskData["disk_size"]).encode())
        time.sleep(0.1)
        usbdev.write("used: {}GB\n".format(diskData["used"]).encode())
        time.sleep(0.1)
        usbdev.write("free: {}GB\n".format(diskData["free"]).encode())
        usbdev.flush()

        time.sleep(0.1)

if __name__ == "__main__":
    main()

