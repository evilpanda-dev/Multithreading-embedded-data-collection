#include <stdio.h>
#include <string.h>
#include <assert.h>
#include <time.h>
#include <sys/utsname.h>
#include <sys/statvfs.h>

#include <math.h>

#include <unistd.h>
#include <fcntl.h>
#include <termios.h>
#include <errno.h>

#define baudrate	B500000

#define String_startsWith(s, match) (strstr((s), (match)) == (s))

const char procstat[] = "/proc/stat";
const char serialPort[] = "/dev/ttyUSB0";
const char mountPath[] = "/";

typedef struct CPUData_ {
	unsigned long long int totalTime;
	unsigned long long int userTime;

	unsigned long long int totalPeriod;
	unsigned long long int userPeriod;
} CPUData;

struct diskData_ {
	unsigned long disk_size;
	unsigned long used;
	unsigned long free;
};

int serialSetup(void)
{
	int usbdev;
	struct termios options;

	usbdev = open(serialPort, O_RDWR | O_NOCTTY | O_NDELAY);

	if (usbdev == -1)
		perror("open_port : Unable to open:");

	tcgetattr(usbdev, &options);

	cfsetispeed(&options, baudrate);
	cfsetospeed(&options, baudrate);

	options.c_cflag |= CS8;
	options.c_iflag |= IGNBRK;
	options.c_iflag &= ~( BRKINT | ICRNL | IMAXBEL | IXON);
	options.c_oflag &= ~( OPOST | ONLCR );
	options.c_lflag &= ~( ISIG | ICANON | IEXTEN | ECHO | ECHOE | ECHOK |
							ECHOCTL | ECHOKE);
	options.c_lflag |= NOFLSH;
	options.c_cflag &= ~CRTSCTS;

	tcsetattr(usbdev, TCSANOW, &options);

	return usbdev;
}

struct diskData_ diskSpace(const char *Path)
{
	struct statvfs vfs;
	struct diskData_ diskData;
	if (!statvfs(Path, &vfs)) {
		diskData.disk_size = vfs.f_blocks * vfs.f_bsize;
		diskData.free = vfs.f_bfree * vfs.f_bsize;
		diskData.used = diskData.disk_size - diskData.free;
	}
	return diskData;
}

int cpuCount(char *buf, int cpus)
{
	FILE *file = fopen(procstat, "r");
	assert(file != NULL);

	do {
		cpus++;
		fgets(buf, 255, file);
	} while (String_startsWith(buf, "cpu"));

	fclose(file);

	return cpus;
}

void systemInfo(int fd, char *buf)
{
	time_t t;
	struct utsname uts;
	time(&t);
	sprintf(buf, "\e[35m%s\r", ctime(&t));
	write(fd, buf, strlen(buf) + 1);
    	fsync(fd);
printf("\e[35m%s\r", ctime(&t));
fflush(stdout);
	usleep(300000);
	uname(&uts);
	//memset(buf, ' ', 500);
	//sprintf(buf, "\e[37mOSname:\e[36m%s\n\r", uts.sysname);
	sprintf(buf, "\e[37mOS:\e[36m%s\n\r", uts.sysname);
	write(fd, buf, strlen(buf) + 1);
    	usleep(300000);
printf("\e[34m\e[43mOS:\e[40m\e[36m%s\n\r", uts.sysname);
/*
printf("\e[31mOS:\e[36m%s\n\r", uts.sysname);
printf("\e[41mOS:\e[36m%s\n\r", uts.sysname);
printf("\e[32mOS:\e[36m%s\n\r", uts.sysname);
printf("\e[42mOS:\e[36m%s\n\r", uts.sysname);
printf("\e[33mOS:\e[36m%s\n\r", uts.sysname);
printf("\e[43mOS:\e[36m%s\n\r", uts.sysname);
printf("\e[34mOS:\e[36m%s\n\r", uts.sysname);
printf("\e[44mOS:\e[36m%s\n\r", uts.sysname);
printf("\e[35mOS:\e[36m%s\n\r", uts.sysname);
printf("\e[45mOS:\e[36m%s\n\r", uts.sysname);
printf("\e[36mOS:\e[36m%s\n\r", uts.sysname);
printf("\e[46mOS:\e[36m%s\n\r", uts.sysname);
printf("\e[37mOS:\e[36m%s\n\r", uts.sysname);
printf("\e[47mOS:\e[36m%s\n\r", uts.sysname);
printf("\e[38mOS:\e[36m%s\n\r", uts.sysname);
printf("\e[48mOS:\e[36m%s\n\r", uts.sysname);
printf("\e[39mOS:\e[36m%s\n\r", uts.sysname);
printf("\e[49mOS:\e[36m%s\n\r", uts.sysname);
*/
fflush(stdout);
	memset(buf, ' ', 500);
	sprintf(buf, "\e[37mVersion:\e[36m%s\n\r", uts.release);
	write(fd, buf, strlen(buf) + 1);
printf("\e[37mVersion:\e[36m%s\n\r", uts.release);
fflush(stdout);
    	usleep(300000);
	memset(buf, ' ', 500);
	sprintf(buf, "\e[37mMachine:\e[36m%s\n\r", uts.machine);
	write(fd, buf, strlen(buf) + 1);
printf("\e[37mMachine:\e[36m%s\n\r", uts.machine);
fflush(stdout);
}

int main(void)
{
	unsigned long long int usertime, nicetime, systemtime, systemalltime,
				idlealltime, idletime, totaltime, virtalltime;
	double total = 0;
	char buffer[500];
	int cpus = -1;
	int i;
	time_t t;
	struct utsname uts;
	int usbdev;
	usbdev = serialSetup();
	FILE *file;
	const unsigned int GB = 1024*1024*1024;
	struct diskData_ diskData;
	diskData = diskSpace(mountPath);
	diskData.disk_size /= GB;
	diskData.used /= GB;
	diskData.free /= GB;
	printf("Disk usage : %lu \t Free space %lu,%lu\n", diskData.disk_size/GB, diskData.free/GB, diskData.used/GB);
	fflush(stdout);
	//return 0;

	cpus = cpuCount(buffer, cpus);
	CPUData cpuData[cpus];

	for (i = 0; i < cpus; i++) {
		cpuData[i].totalTime = 1;
		cpuData[i].userTime = 0;
		cpuData[i].totalPeriod = 1;
		cpuData[i].userPeriod = 0;
	}

	sprintf(buffer, "\e[38m\e[48m");
	write(usbdev, buffer, strlen(buffer) + 1);
	fsync(usbdev);

printf("\e[38m\e[48m");
fflush(stdout);

	sprintf(buffer, "\ec\e[2s\e[1r");
	write(usbdev, buffer, strlen(buffer) + 1);
	fsync(usbdev);

printf("\ec\e[2s\e[1r\n");
fflush(stdout);

	int cpuid;
	unsigned long long int ioWait, irq, softIrq, steal, guest;
	ioWait = irq = softIrq = steal = guest = 0;


	while (1) {
		sprintf(buffer, "\e[H");
		write(usbdev, buffer, strlen(buffer) + 1);
		fsync(usbdev);
printf("\e[H\n");
fflush(stdout);
		usleep(100000);



		// Remove if working
		systemInfo(usbdev, buffer);
		fsync(usbdev);




		usleep(100000);
		file = fopen(procstat, "r");
		for (i = 0; i < cpus; i++) {
                        usleep(100000);
			fgets(buffer, 255, file);
			if (i == 0) {
				sscanf(buffer, "cpu %llu %llu %llu %llu %llu %llu %llu %llu %llu", &usertime, &nicetime, &systemtime, &idletime, &ioWait, &irq, &softIrq, &steal, &guest);
			} else {
				sscanf(buffer, "cpu%d %llu %llu %llu %llu %llu %llu %llu %llu %llu", &cpuid, &usertime, &nicetime, &systemtime, &idletime, &ioWait, &irq, &softIrq, &steal, &guest);
				assert(cpuid == i - 1);
			}

			idlealltime = idletime + ioWait;
			systemalltime = systemtime + irq + softIrq;
			virtalltime = steal + guest;
			totaltime = usertime + nicetime + systemalltime +
						idlealltime + virtalltime;

			assert(usertime >= cpuData[i].userTime);
			assert(totaltime >= cpuData[i].totalTime);

			cpuData[i].userPeriod = usertime - cpuData[i].userTime;
			cpuData[i].totalPeriod = totaltime - cpuData[i].totalTime;

			cpuData[i].totalTime = totaltime;
			cpuData[i].userTime = usertime;

			total = (double)cpuData[i].totalPeriod;
			if ((i != 0) && (i%2 == 1)) {	
				//sprintf(buffer, "\e[33mcpu%d :\e[32m%4.1f%% ", i, cpuData[i].userPeriod/total*100.0);
				sprintf(buffer, "cpu%d :%4.1f%% ", i, cpuData[i].userPeriod/total*100.0);
				write(usbdev, buffer, strlen(buffer) + 1);
				fsync(usbdev);
printf("\e[33mcpu%d :\e[32m%4.1f%% ", i, cpuData[i].userPeriod/total*100.0);
fflush(stdout);
			} else if ((i != 0) && (i%2 == 0)) {
				//sprintf(buffer, "\e[33mcpu%d :\e[32m%4.1f%%  \n\r", i, cpuData[i].userPeriod/total*100.0);
				sprintf(buffer, "cpu%d :%4.1f%%  \n\r", i, cpuData[i].userPeriod/total*100.0);
				write(usbdev, buffer, strlen(buffer) + 1);
				fsync(usbdev);
printf("\e[33mcpu%d :\e[32m%4.1f%%  \n\r", i, cpuData[i].userPeriod/total*100.0);
fflush(stdout);
			}
		}
	        usleep(100000);
		sprintf(buffer, "\e[37msda1\n\r\e[33mdisk_size : \e[32m%ldGB\n\r", diskData.disk_size);
		write(usbdev, buffer, strlen(buffer) + 1);
printf("\e[37msda1\n\r\e[33mdisk_size : \e[32m%ldGB\n\r", diskData.disk_size);
fflush(stdout);
		usleep(100000);
		sprintf(buffer, "\e[35mused : \e[32m%ldGB\n\r", diskData.used);
		write(usbdev, buffer, strlen(buffer) + 1);
printf("\e[35mused : \e[32m%ldGB\n\r", diskData.used);
fflush(stdout);
		usleep(100000);
		sprintf(buffer, "\e[36mfree : \e[32m%ldGB", diskData.free);
		write(usbdev, buffer, strlen(buffer) + 1);
printf("\e[36mfree : \e[32m%ldGB", diskData.free);
fflush(stdout);
		usleep(100000);
		fclose(file);
	}
	
	return 0;
}
