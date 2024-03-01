#!/bin/bash

ID=$(id -u)

R="\e[31m
G="\e[32m
Y="\e[33m
N="\e[0m

TIMESTAMP=$(date +%F-%H-%M-%S)
LOGFILE="/tmp/$0-$TIMESTAMP.log"

echo "The exacution startwith $TIMESTAMP" &>> $LOGFILE

VALIDATION (){
    if [ $1 -ne 0 ]
    then 
        echo -e "$2...$R FAILURE $N"
    else
        echo -e "$2...$R SUCCESS $N"
    fi
}

if [ $ID -ne 0 ]
then
   echo -e "$R Error: please run this script with root access $N"
   exit 1
else
   echo "you are root access"
fi