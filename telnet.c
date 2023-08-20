#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <signal.h>
#include <math.h>
#include <time.h>

#define BUFFER_SIZE 1024

FILE *fp = NULL;
int terminate = 0;

void sigintHandler(int sig_num){
    terminate = 1;
    signal(SIGINT, sigintHandler);
    printf("\nTerminating telnet connection...\n");   
    if (fp != NULL) {
        pclose(fp);
    }
    exit(0);
}

int main(int argc, char **argv) {
    time_t start_time, current_time;
    start_time = time(NULL);

    printf("@focus off\n"); 		
    printf("@g0 on\n");                     
    printf("@default linewidth 3\n");
    printf("@default linestyle 1\n");
    printf("@default color 4\n");
    printf("@default pattern 1\n");
    printf("@default font 2\n");
    printf("@default char size 1.000000\n");
    printf("@default symbol size 0.23\n");
    printf("@background color 9\n");

    printf("@frame background color 5\n");
    printf("@frame background pattern 3\n");
    printf("@with g0\n");                   
    printf("@view 0.1, 0.1, 1.2, 0.9\n");   
    printf("@subtitle \" Power vs Time \"\n");     
    signal(SIGINT, sigintHandler); 

    fp = popen("telnet 192.168.4.1 23", "r");

    if (fp == NULL) {
        printf("Failed to open pipe.\n");
        return 1;
    }

    char buffer[BUFFER_SIZE];
    float value1, value2, value3, value4;

    float *values = malloc(sizeof(float));
    int values_size = 1;  // how many items we can currently store
    int values_count = 0;  // how many items we have stored

    printf("@with g0\n");               
    printf("@kill s0\n");
                printf("@world ymin 2.2\n");
                printf("@world ymax 2.8\n");
                printf("@yaxis tick major 0.1\n");
                printf("@yaxis tick minor 0\n");

    while(!terminate) {
        fgets(buffer, BUFFER_SIZE, fp);
        fgets(buffer, BUFFER_SIZE, fp);
        fgets(buffer, BUFFER_SIZE, fp);
        
        while (fgets(buffer, BUFFER_SIZE, fp) && !terminate) {
            current_time = time(NULL);
            double elapsed_time = difftime(current_time, start_time);

            if (strlen(buffer) > 0) {
                sscanf(buffer, "%f, %f, %f, %f", &value1, &value2, &value3, &value4);

                // Check if we need to resize the values array
                if (values_count >= values_size) {
                    values_size *= 2;
                    values = realloc(values, values_size * sizeof(float));
                }

                values[values_count] = value3;
                values_count++;

                // Print all values
                for (int i = 0; i < values_count; i++) {
                    printf("%d %d\n", i, (int)(values[i]*1000));
                }

                printf("@autoscale\n"); 
                printf("@redraw\n");
                printf("@sleep 0.1\n");
            }
        }
    }

    free(values);
    pclose(fp);
    exit(0);
    return 0;
}

