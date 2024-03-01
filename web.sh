#!/bin/bash
ID=($id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33M"
N="\e[0m"

TIMESTAMP=$(time +%F-%H-%M-%S)
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

dnf install nginx -y

VALIDATE $? "Installing nginx"

systemctl enable nginx

VALIDATE $? "Installing nginx"

systemctl start nginx

VALIDATE $? "STARTING NGINX"

rm -rf /usr/share/nginx/html/*

VALIDATE $? "remove default website


curl -o /tmp/web.zip https://roboshop-builds.s3.amazonaws.com/web.zip

VALIDATE $? "Download web application"

cd /usr/share/nginx/html

VALIDATE $? "Download web applicatin"

unzip /tmp/web.zip

VALIDATE $? "UNZIPPING APPLICATION"

cp /home/centos/roboshop-shell/roboshop.conf /etc/nginx/default.d/roboshop.conf 

VALIDATE $? "copied roboshop reverse proxy"

systemctl restart nginx 

VALIDATE $? "restarting nginx