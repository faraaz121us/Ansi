#!/bin/bash
services="jenkins tomcat"
for i in $services
do
	sudo service $i stop
	if [ $? -ne 0 ]; then
		echo "$i CANNOT be stopped"
	fi
done
	mv /home/ec2-user/apache-tomcat-9.0.70/logs /home/ec2-user/
       mv /home/ec2-user/apache-tomcat-9.0.70/webapps/Lab6A.war /home/ec2-user/
cp /home/ec2-user/devopsrepo/maven-hello-world/my-app/target/my-app-1.0-SNAPSHOT.jar /home/ec2-user/apache-tomcat-9.0.70/webapps/
for i in $services
do
	sudo service $i start
	if [ $? -ne 0 ]; then
		echo " CANNOT start $i"
	fi
done
