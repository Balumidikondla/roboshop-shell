#!/bin/bash

ID=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"

TIMESTAMP=$(date +%F-%H-%M-%S)
LOGFILE="/tmp/$0-$TIMESTAMP.log"

echo "script started exacuting at $TIMESTAMP" &>> $LOGFILE

VALIDATE (){
    if [ $1 -ne 0 ]
    then 
       echo -e "$2....$R FAILED $N"
    else
       echo -e "$2...$G success $N"git 
    fi
}

if [ $ID -ne 0 ]
then 
   echo -e "$R ERROR :: Please run this script with root access $N"
   exit 1
else
   echo "you are root user"
fi

dnf module disable nodejs -y  &>> $LOGFILE

VALIDATE $? "Disable"

dnf module enable nodejs:18 -y  &>> $LOGFILE

VALIDATE $? "Enable"

dnf install nodejs -y  &>> $LOGFILE

VALIDATE $? "INSTALLING"
id roboshop
if [ $? -ne 0 ]
then 
    useradd roboshop
    VALIDATE $? "roboshop user creation"
else
   echo  -e "roboshp user already exist $Y skipping $N"
fi



mkdir -p /app

VALIDATE $? "MAKE THE DIRECTORY"

curl -o /tmp/cart.zip https://roboshop-builds.s3.amazonaws.com/cart.zip

VALIDATE $? "Download the directory"

cd /app 

unzip /tmp/cart.zip

VALIDATE $? "unzip that condition"

npm install &>> $LOGFILE

VALIDATE $? "Installing this "

cp /home/centos/roboshop-shell/cart.service /etc/systemd/system/cart.service &>> $LOGFILE

VALIDATE $? "GIVE ACCESS TO THE DIRECTORY"

systemctl daemon-reload &>> $LOGFILE

VALIDATE $? "RELOAD THE VALUE OF THIS"

systemctl enable cart &>> $LOGFILE

VALIDATE $? "ENABLE THE cart"

systemctl start cart &>> $LOGFILE

VALIDATE $? "START THIS ACTION NOW"

