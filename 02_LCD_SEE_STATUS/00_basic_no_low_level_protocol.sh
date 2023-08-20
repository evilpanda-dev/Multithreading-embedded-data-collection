#!/bin/bash 


flag=0 
serialPort="/dev/ttyUSB0" 


trap programExit SIGINT SIGKILL SIGTERM 

gcc -o port_open port_open.c 
#./port_open $serialPort & 
subppid=$! 

#echo -e "--"
#echo -e $subppid
#echo -e "--"
sleep 0.1 


function programExit() 
{ 
#	kill -s SIGKILL $subppid 
	exit 
} 


declare -i length 
isbusy=0 


writeData () { 
########	echo -ne "\006" > $serialPort 
#echo -e "writeData $1"
########	str=${1//\\} 
########	length=$((${#str} + 48)) 
#echo -e "______"
#echo -e $length
#echo -e "______"
#echo -ne $(printf \\$(printf '%03o' $length))
#echo -e "_"
########	echo -ne $(printf \\$(printf '%03o' $length)) > $serialPort 
########	while [ "$isbusy" != 6 ] 
########	do 
########		isbusy=$(head -c 1 $serialPort) 
########	done 
	echo -ne "$1" > $serialPort 
#echo -e "______"
#echo -e "$1" 
#echo -e "______"
########	isbusy=0 
} 

#echo -e "\e[5s\e[0r" > $serialPort
echo -e "\ec"  > $serialPort
echo -e "Hello ODROID-SHOW"  > $serialPort

#writeData "\e[5s\e[0r"
writeData "\ec" 
writeData "Hello ODROID-SHOW" 

sleep 2

writeData "\ec" 
echo -e "\ec\e[0r" > $serialPort

while true
do
	echo -ne "\e[0r" > $serialPort
	echo -ne "\e[0;0,240;320i" > $serialPort
	cat penguin.raw | while [ 1 ] ;do read line;  echo $line > $serialPort; sleep 0.1; done
	sleep 100;
	echo -e "\e[1r" > $serialPort
	echo -e "\e[0;0,320;240i" > $serialPort
	cat butterfly.raw > $serialPort
	echo -e "\e[0r" > $serialPort
	echo -e "\e[0;0,240;320i" > $serialPort
	cat woof.raw > $serialPort
	echo -e "\ec\e[0r" > $serialPort
	echo -e "\e[40;10,220;200i" > $serialPort
	cat paint.raw > $serialPort
	echo -e "\ec\e[1r" > $serialPort
	echo -e "\e[10;10,190;200i" > $serialPort
	cat paint.raw > $serialPort
done

programExit 
