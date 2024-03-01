#!/bin/bash

ID=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"
MONGODB_HOST=mongodb.nagendrababu.online

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

curl -o /tmp/catalogue.zip https://roboshop-builds.s3.amazonaws.com/catalogue.zip

VALIDATE $? "Download the directory"

cd /app 

unzip /tmp/catalogue.zip

VALIDATE $? "unzip that condition"

npm install &>> $LOGFILE

VALIDATE $? "Installing this "

cp /home/centos/roboshop-shell catalogue.service /etc/systemd/system/catalogue.service

VALIDATE $? "GIVE ACCESS TO THE DIRECTORY"

systemctl daemon-reload &>> $LOGFILE

VALIDATE $? "RELOAD THE VALUE OF THIS"

systemctl enable catalogue &>> $LOGFILE

VALIDATE $? "ENABLE THE CATALOGUE"

systemctl start catalogue &>> $LOGFILE

VALIDATE $? "START THIS ACTION NOW"

cp /home/centos/roboshop-shell/etc/yum.repos.d/mongo.repo

dnf install mongodb-org-shell -y &>> $LOGFILE 

VALIDATE $? "Installing mongodb"


mongo --host $MONGDB_HOST </app/schema/catalogue.js &>> $LOGFILE

VALIDATE $? "Loading catalogue data into MongDB"





















