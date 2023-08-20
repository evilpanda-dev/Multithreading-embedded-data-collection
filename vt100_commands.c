#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <fcntl.h>
#include <termios.h>
#include <errno.h>

#define baudrate B500000

int serialSetup(void)
{
    int usbdev;
    struct termios options;

    usbdev = open("/dev/ttyUSB1", O_RDWR | O_NOCTTY | O_NDELAY);

    if (usbdev == -1)
        perror("open_port : Unable to open:");

    tcgetattr(usbdev, &options);

    cfsetispeed(&options, baudrate);
    cfsetospeed(&options, baudrate);

    options.c_cflag |= (CLOCAL | CREAD);
    options.c_lflag |= ICANON;

    tcsetattr(usbdev, TCSANOW, &options);

    return usbdev;
}

__attribute__((visibility("default")))
void write_sensor_data(
    float temperature, float humidity, float light_level, float sound_level, 
    float gas, float distance, float pressure, float altitude, float sealevel_pressure) 
{
    char buffer[500];
    int usbdev;
    usbdev = serialSetup();

    // Move the cursor to specific lines, clear the line, and write the sensor data
    sprintf(buffer, "\e[1;1H\e[2K\e[31mTemperature: \e[37m%4.2fC", temperature);
    write(usbdev, buffer, strlen(buffer) + 1);
    fsync(usbdev);
    usleep(100000); // 0.1 second delay

    sprintf(buffer, "\e[2;25H\e[2K\e[32mHumidity: \e[37m%d%", (int)humidity);
    write(usbdev, buffer, strlen(buffer) + 1);
    fsync(usbdev);
    usleep(100000); // 0.1 second delay

    sprintf(buffer, "\e[3;50H\e[2K\e[33mLight level: \e[37m%dlux", (int)light_level);
    write(usbdev, buffer, strlen(buffer) + 1);
    fsync(usbdev);
    usleep(100000); // 0.1 second delay

    sprintf(buffer, "\e[4;75H\e[2K\e[34mSound level: \e[37m%ddb", (int)sound_level);
    write(usbdev, buffer, strlen(buffer) + 1);
    fsync(usbdev);
    usleep(100000); // 0.1 second delay

    sprintf(buffer, "\e[5;100H\e[2K\e[35mGas: \e[37m%d", (int)gas);
    write(usbdev, buffer, strlen(buffer) + 1);
    fsync(usbdev);
    usleep(100000); // 0.1 second delay

    sprintf(buffer, "\e[6;125H\e[2K\e[36mDistance: \e[37m%4.2fcm", distance);
    write(usbdev, buffer, strlen(buffer) + 1);
    fsync(usbdev);
    usleep(100000); // 0.1 second delay

    sprintf(buffer, "\e[7;150H\e[2K\e[31mPressure: \e[37m%4.2fPa", pressure);
    write(usbdev, buffer, strlen(buffer) + 1);
    fsync(usbdev);
    usleep(100000); // 0.1 second delay

    sprintf(buffer, "\e[8;175H\e[2K\e[32mAltitude: \e[37m%4.2fm", altitude);
    write(usbdev, buffer, strlen(buffer) + 1);
    fsync(usbdev);
    usleep(100000); // 0.1 second delay

    sprintf(buffer, "\e[9;200H\e[2K\e[33mSea-lvl Pressure:\e[37m%dPa", (int)sealevel_pressure);
    write(usbdev, buffer, strlen(buffer) + 1);
    fsync(usbdev);
    usleep(100000); // 0.1 second delay


}

int main() {
    return EXIT_SUCCESS;
}

