#!/bin/bash 


flag=0 
serialPort="/dev/ttyUSB0" 


trap programExit SIGINT SIGKILL SIGTERM 


gcc -o port_open port_open.c 
./port_open $serialPort & 
subppid=$! 
#echo -e "--"
#echo -e $subppid
#echo -e "--"
sleep 0.1 


function programExit() 
{ 
	kill -s SIGKILL $subppid 
	exit 
} 


declare -i length 
isbusy=0 


writeData () { 
	echo -ne "\006" > $serialPort 
	str=${1//\\} 
	length=$((${#str} + 48)) 
#echo -e "______"
#echo -e $length
#echo -e "______"
#echo -ne $(printf \\$(printf '%03o' $length))
#echo -e "_"
	echo -ne $(printf \\$(printf '%03o' $length)) > $serialPort 
	while [ "$isbusy" != 6 ] 
	do 
		isbusy=$(head -c 1 $serialPort) 
		echo $isbusy
	done 
	echo -ne "$1" > $serialPort 
	isbusy=0 
#echo -e "______"
#echo -e "$1" 
#echo -e "______"
} 


#writeData "\e[5s\e[0r"
writeData "\ec" 
writeData "Hello ODROID-SHOW" 


programExit 
