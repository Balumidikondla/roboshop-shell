#!/bin/bash
ID=($id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33M"
N="\e[0m"

TIMESTAMP=$(date +%F-%H-%M-%S)
LOGFILE="/tmp/$0-$TIMESTAMP.log"

echo "script exacuting at  $TIMESTAMP" &>> $LOGFILE"

VALIDATION (){
    if [ $1 -ne 0 ]
    then 
       echo -e "$2...$R FAILURE $N"
    else
       echo -e "$2...$R success $N"
fi
}

fi [ $ID -ne 0 ]
then 
    echo -e "$R plese run this script with root access $N"
    exit 1
else
    echo "you are root user"
fi

dnf install nginx -y &>> $LOGFILE

VALIDATE $? "Installing nginx"

systemctl enable nginx &>> $LOGFILE

VALIDATE $? "Installing nginx"

systemctl start nginx &>> $LOGFILE

VALIDATE $? "STARTING NGINX"

rm -rf /usr/share/nginx/html/* &>> $LOGFILE

VALIDATE $? "remove default website


curl -o /tmp/web.zip https://roboshop-builds.s3.amazonaws.com/web.zip &>> $LOGFILE

VALIDATE $? "Download web application"

cd /usr/share/nginx/html 

VALIDATE $? "Download web application"

unzip /tmp/web.zip &>> $LOGFILE

VALIDATE $? "UNZIPPING APPLICATION"

cp /home/centos/roboshop-shell/roboshop.conf /etc/nginx/default.d/roboshop.conf &>> $LOGFILE

VALIDATE $? "copied roboshop reverse proxy"

systemctl restart nginx &>> $LOGFILE

VALIDATE $? "restarting nginx