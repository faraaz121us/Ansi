#!/bin/bash
services="jenkins tomcat JFROG httpd"
failed_services=()

for i in $services
do
  sudo service $i stop
  if [ $? -ne 0 ]; then
    echo "$i CANNOT be stopped"
    failed_services+=($i)
  fi
done

mv source destin
mv source1 destin1
cp source2 destin2

for i in $services
do
  sudo service $i start
  if [ $? -ne 0 ]; then
    echo "CANNOT start $i"
    failed_services+=($i)
  fi
done

if [ ${#failed_services[@]} -ne 0 ]; then
  echo "The following services could not be started or stopped: ${failed_services[@]}"
  exit 1
fi

