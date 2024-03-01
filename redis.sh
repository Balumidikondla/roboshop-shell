#!/bin/bash

ID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

TIMESTAMP=$("date +%F-%H-%M-%S)
LOGFILE="/tmp/$0-$TIMESTAMP.log"
exec &>$LOGFILE

echo "Script started at $TIMESTAMP" &>> $LOGFILE

VALIDATE (){
    if [$1 -ne 0]
    then
        echo -e "$2...$R Failure $N"
    else
        echo -e "$2...$R Success $N"
fi
}

if [ $ID -ne 0 ]
then 
    echo -e "$R Error : please run this script with root access $N"
    exit 1
else
    echo  "you are root user"
fi

dnf install https://rpms.remirepo.net/enterprise/remi-release-8.rpm -y

VALIDATE $? "INSTALLING THE APPLICATION"

dnf module enable redis:remi-6.2 -y

VALIDATE $? "ENABLE THIS APPLICATION"

dnf install redis -y

VALIDATE $? "INSTALLING REDIS"

sed -i 's/127.0.0.1/0.0.0.0/g' /etc/redis.conf

VALIDATE $? "ALLOWING REMOTE CONNECTION"

systemctl enable redis

VALIDATE $? "ENABLE AFTER THE CRATION"

systemctl start redis

VALIDATE $? "Start redis"

