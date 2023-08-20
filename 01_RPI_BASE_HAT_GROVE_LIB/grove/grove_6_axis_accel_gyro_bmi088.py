from __future__ import division
from __future__ import print_function
from ctypes import *
from ctypes import util
import sys
from grove.i2c import Bus
import math


BMI088_ACCEL_I2C_ADDR = 0x19
BMI088_GYRO_I2C_ADDR  = 0x69

BMI08X_ACCEL_PM_ACTIVE, \
BMI08X_ACCEL_PM_SUSPEND = 0,3

BMI088_ACCEL_RANGE_3G,  \
BMI088_ACCEL_RANGE_6G,  \
BMI088_ACCEL_RANGE_12G, \
BMI088_ACCEL_RANGE_24G  = 0,1,2,3

BMI08X_ACCEL_BW_OSR4, \
BMI08X_ACCEL_BW_OSR2, \
BMI08X_ACCEL_BW_NORMAL= 0,1,2

BMI08X_ACCEL_ODR_12_5_HZ, \
BMI08X_ACCEL_ODR_25_HZ,   \
BMI08X_ACCEL_ODR_50_HZ,   \
BMI08X_ACCEL_ODR_100_HZ,  \
BMI08X_ACCEL_ODR_200_HZ,  \
BMI08X_ACCEL_ODR_400_HZ,  \
BMI08X_ACCEL_ODR_800_HZ,  \
BMI08X_ACCEL_ODR_1600_HZ  = 5, 6, 7, 8, 9, 10, 11, 12

BMI08X_GYRO_PM_NORMAL,      \
BMI08X_GYRO_PM_DEEP_SUSPEND,\
BMI08X_GYRO_PM_SUSPEND    = 0x0, 0x20, 0x80

BMI08X_GYRO_RANGE_2000_DPS, \
BMI08X_GYRO_RANGE_1000_DPS, \
BMI08X_GYRO_RANGE_500_DPS,  \
BMI08X_GYRO_RANGE_250_DPS,  \
BMI08X_GYRO_RANGE_125_DPS   = 0, 1, 2, 3, 4

BMI08X_GYRO_BW_532_ODR_2000_HZ, \
BMI08X_GYRO_BW_230_ODR_2000_HZ, \
BMI08X_GYRO_BW_116_ODR_1000_HZ, \
BMI08X_GYRO_BW_47_ODR_400_HZ,   \
BMI08X_GYRO_BW_23_ODR_200_HZ,   \
BMI08X_GYRO_BW_12_ODR_100_HZ,   \
BMI08X_GYRO_BW_64_ODR_200_HZ,   \
BMI08X_GYRO_BW_32_ODR_100_HZ,   \
BMI08X_GYRO_ODR_RESET_VAL   =   0, 1, 2, 3, 4, 5, 6, 7, 0x80


__c_module = "bmi088"

try:
    _ = util.find_library(__c_module)
    _bmi = cdll.LoadLibrary(_)
except Exception:
    print("Error: module lib{}.so unusable, please install lib{}".
          format(__c_module, __c_module))
    sys.exit(1)

class BMI08xCfg(Structure):
    _fields_ = [("power", c_ubyte), \
                ("range", c_ubyte), \
                ("bw",    c_ubyte), \
                ("odr",   c_ubyte)]



class GroveAccelGyroBMI088(object):
    def __init__(self, acc_addr = BMI088_ACCEL_I2C_ADDR, gyro_addr = BMI088_GYRO_I2C_ADDR):
        _bmi.rpi_bmi088_alloc.restype = c_char_p
        self._dev = _bmi.rpi_bmi088_alloc()
        dev_path = b"/dev/i2c-%d" %(Bus().bus)
        

        accel_cfg = BMI08xCfg(BMI08X_ACCEL_PM_ACTIVE,
                              BMI088_ACCEL_RANGE_6G,
                              BMI08X_ACCEL_BW_NORMAL,
                              BMI08X_ACCEL_ODR_100_HZ)
        gyro_cfg = BMI08xCfg(BMI08X_GYRO_PM_NORMAL,
                              BMI08X_GYRO_RANGE_1000_DPS,
                              BMI08X_GYRO_BW_23_ODR_200_HZ,
                              BMI08X_GYRO_BW_23_ODR_200_HZ)
        _bmi.rpi_bmi088_init.argtypes = [c_char_p,c_char_p,c_int,c_int,POINTER(BMI08xCfg),POINTER(BMI08xCfg)]
        _bmi.rpi_bmi088_init(self._dev,
                             dev_path,
                             acc_addr,
                             gyro_addr,
                             byref(accel_cfg),
                             byref(gyro_cfg))

    def __del__(self):
        _bmi.rpi_bmi088_free(self._dev)

    def get_sensor_time(self):
        return _bmi.rpi_bmi088_get_sensor_time(self._dev)

    def get_accel(self):
        x, y, z = c_double(), c_double(), c_double()
        _bmi.rpi_bmi088_get_accel(self._dev,
                                  byref(x), byref(y), byref(z))
        return x.value, y.value, z.value

    def get_gyro(self):
        x, y, z = c_double(), c_double(), c_double()
        _bmi.rpi_bmi088_get_gyro(self._dev,
                                  byref(x), byref(y), byref(z))
        return x.value, y.value, z.value

Grove = GroveAccelGyroBMI088

def main():
    import time
    Ax=0
    Yx=0
    c=0
    p=0
    tmold=0
    
    print(\
""" Make sure 6-Axis-Accelerometer-Gyroscope(BMI088)
   inserted in one I2C slot of Grove-Base-Hat
""")
    snr = GroveAccelGyroBMI088()
    tmold = snr.get_sensor_time()
    x, y, z = snr.get_accel()
    
    while True:
        Axold=x
        Yxold=y
        tm = snr.get_sensor_time()
        # don't ask me why 26000, it's magic.
        print("Sensor time: {:.2f} S".format(tm / 26000.0))
        x, y, z = snr.get_accel()
        print(" AX = %7.2f mg  AY = %7.2f mg  AZ = %7.2f mg" % (x, y, z))
        #print((x-Axold))
        if(math.fabs(x-Axold) > 5 ):
            if(math.fabs(y-Yxold)>2):
                
            
        
                Ax=((1)*0.0098*(x-Axold))
                Yx=((1)*0.0098*(y-Yxold))
                p=Ax*Ax+Yx*Yx
                c=math.sqrt(p)
                #x, y, z = snr.get_gyro()
                #print(" GX = %7.2f dps GY = %7.2f dps GZ = %7.2f dps" % (x, y, z))
                print('Speed of acc %2.2f m/s'% c)
                tmold=tm
        else:
            c=0
    
    
        time.sleep(1)
        with open('/tmp/3', 'a') as f:   
            f.write('%d \n' % c)
            time.sleep(0.1)

if __name__ == '__main__':
    main()

