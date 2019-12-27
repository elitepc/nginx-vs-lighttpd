#! /bin/bash

#apt-get update
#apt-get install apache2-utils -y
ulimit 100000

echo "running wrk -c40000 -d300s http://10.1.1.13:80"
#wrk -c40000 -d300s http://10.1.1.13:80
ab -r -k -n 1000000 -c 50 -g /root/plot -e /root/csvs http://10.1.1.13:80/
#weighttp http://10.1.1.13:80/html/index1KB.html -n 1000000 -c 1000 -k