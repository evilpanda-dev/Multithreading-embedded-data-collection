import time
from grove.adc import ADC

class GroveGasSensorMQ2:
    def __init__(self, channel):
        self.channel = channel
        self.adc = ADC()

    @property
    def value(self):
        return self.adc.read(self.channel)

def main():
    sensor = GroveGasSensorMQ2(4)

    print('Detecting gas...')
    while True:
        print('Gas concentration ADC value: {}'.format(sensor.value))
        time.sleep(1)

if __name__ == '__main__':
    main()

