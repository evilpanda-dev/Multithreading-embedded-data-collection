#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <fcntl.h>
#include <termios.h>
#include <time.h>
#include <errno.h>

#define baudrate B500000

int serialSetup(void)
{
    int usbdev;
    struct termios options;

    usbdev = open("/dev/ttyUSB0", O_RDWR | O_NOCTTY | O_NDELAY);

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

int main(void)
{
    char buffer[500];
    int usbdev;
    usbdev = serialSetup();
    srand(time(0)); // Seed the random number generator.

    // Clear the screen and set cursor to home position.
    sprintf(buffer, "\ec");
    write(usbdev, buffer, strlen(buffer) + 1);
    fsync(usbdev);
    usleep(1000000); // 1 second delay

    while (1) {
        // Generate and display random sensor readings. 
        sprintf(buffer, "\e[H\e[35mTemperature: \e[37m%4.2f\n\r", (rand()%10000)/100.0);
        write(usbdev, buffer, strlen(buffer) + 1);
        fsync(usbdev);
        usleep(100000); // 0.1 second delay

        sprintf(buffer, "\e[37mHumidity: \e[37m%4.2f\n\r", (rand()%10000)/100.0);
        write(usbdev, buffer, strlen(buffer) + 1);
        fsync(usbdev);
        usleep(100000); // 0.1 second delay

        sprintf(buffer, "\e[36mLight level: \e[37m%4.2f\n\r", (rand()%10000)/100.0);
        write(usbdev, buffer, strlen(buffer) + 1);
        fsync(usbdev);
        usleep(100000); // 0.1 second delay

        sprintf(buffer, "\e[33mSound level: \e[37m%4.2f\n\r", (rand()%10000)/100.0);
        write(usbdev, buffer, strlen(buffer) + 1);
        fsync(usbdev);
        usleep(100000); // 0.1 second delay

        sprintf(buffer, "\e[33mGas level: \e[37m%4.2f\n\r", (rand()%10000)/100.0);
        write(usbdev, buffer, strlen(buffer) + 1);
        fsync(usbdev);
        usleep(100000); // 0.1 second delay

        sprintf(buffer, "\e[33mDistance: \e[37m%4.2f\n\r", (rand()%10000)/100.0);
        write(usbdev, buffer, strlen(buffer) + 1);
        fsync(usbdev);
        usleep(100000); // 0.1 second delay

        sprintf(buffer, "\e[33mPressure: \e[37m%4.2f\n\r", (rand()%10000)/100.0);
        write(usbdev, buffer, strlen(buffer) + 1);
        fsync(usbdev);
        usleep(100000); // 0.1 second delay

        sprintf(buffer, "\e[33mAltitude: \e[37m%4.2f\n\r", (rand()%10000)/100.0);
        write(usbdev, buffer, strlen(buffer) + 1);
        fsync(usbdev);
        usleep(100000); // 0.1 second delay

        sprintf(buffer, "\e[33mSealevel-pressure: \e[37m%4.2f\n\r", (rand()%10000)/100.0);
        write(usbdev, buffer, strlen(buffer) + 1);
        fsync(usbdev);
        usleep(100000); // 0.1 second delay

        // Sleep for 0.5 second before the next update.
        //usleep(500000);
    }
    
    return 0;
}

