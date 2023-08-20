//see man tty_ioctl
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <termios.h>
#include <errno.h>

#define baudrate	B500000

static char serialPort[] = "/dev/ttyUSB0";

int main(int argc, char **argv)
{
	int usbdev;
	struct termios config_options;

	if (argc == 2) {
		sprintf(serialPort, "%s", argv[1]);
	} else if (argc > 2) {
		printf("Too many arguments\n");
		return 0;
	}
	else
		printf("1 or less arguments\n");

	usbdev = open(serialPort, O_RDWR | O_NOCTTY | O_NDELAY);

	if (usbdev == -1)
		perror("open_port : Unable to open:");

	tcgetattr(usbdev, &config_options);

	cfsetispeed(&config_options, baudrate);
	cfsetospeed(&config_options, baudrate);

	config_options.c_cflag |= CS8;
	config_options.c_iflag |= IGNBRK;
	config_options.c_iflag &= ~( BRKINT | ICRNL | IMAXBEL | IXON);
	config_options.c_oflag &= ~( OPOST | ONLCR );
	config_options.c_lflag &= ~( ISIG | ICANON | IEXTEN | ECHO | ECHOE | ECHOK | ECHOCTL | ECHOKE);
	config_options.c_lflag |= NOFLSH;
	config_options.c_cflag &= ~CRTSCTS;

	tcsetattr(usbdev, TCSANOW, &config_options);

	while(1)
		sleep(2);

	return 0;
}
