#! /bin/bash

SERVER="http://10.1.0.9:80/"
HTML="html/"
JS="html/"
IMG="img/"
_1KB="1KB"
_10KB="10KB"
_100KB="100KB"
_1MB="1MB"
HTML_EXTENSION=".html"
JS_EXTENSION=".js"
PNG_EXTENSION=".png"


HTML1KB="${SERVER}${HTML}${_1KB}${HTML_EXTENSION}"
HTML10KB="${SERVER}${HTML}${_10KB}${HTML_EXTENSION}"
HTML100KB="${SERVER}${HTML}${_100KB}${HTML_EXTENSION}"
HTML1MB="${SERVER}${HTML}${_1MB}${HTML_EXTENSION}"

JS1KB="${SERVER}${JS}${_1KB}${JS_EXTENSION}"
JS10KB="${SERVER}${JS}${_10KB}${JS_EXTENSION}"
JS100KB="${SERVER}${JS}${_100KB}${JS_EXTENSION}"
JS1MB="${SERVER}${JS}${_1MB}${JS_EXTENSION}"

IMG1KB="${SERVER}${IMG}${_1KB}${PNG_EXTENSION}"
IMG10KB="${SERVER}${IMG}${_10KB}${PNG_EXTENSION}"
IMG100KB="${SERVER}${IMG}${_100KB}${PNG_EXTENSION}"
IMG1MB="${SERVER}${IMG}${_1MB}${PNG_EXTENSION}"

#apt-get update
#apt-get install apache2-utils -y
ulimit 500000
ulimit -n 500000
ulimit -u 500000
URL_TO_TEST=${HTML1KB}
echo "running wrk -c40000 -d300s ${URL_TO_TEST}"
wrk -c40000 -d300s ${URL_TO_TEST} | curl -F 'sprunge=<-' http://sprunge.us
echo "ab -r -k -n 1000000 -c 50 -g /root/plot -e /root/csvs ${URL_TO_TEST}"
ab -r -k -n 1000000 -c 50 -g /root/plot -e /root/csvs ${URL_TO_TEST} | curl -F 'sprunge=<-' http://sprunge.us
echo "weighttp ${URL_TO_TEST} -n 1000000 -c 1000 -k"
weighttp ${URL_TO_TEST} -n 1000000 -c 50 -k | curl -F 'sprunge=<-' http://sprunge.us

URL_TO_TEST=${HTML10KB}
echo "running wrk -c40000 -d300s ${URL_TO_TEST}"
wrk -c40000 -d300s ${URL_TO_TEST} | curl -F 'sprunge=<-' http://sprunge.us
echo "ab -r -k -n 1000000 -c 50 -g /root/plot -e /root/csvs ${URL_TO_TEST}"
ab -r -k -n 1000000 -c 50 -g /root/plot -e /root/csvs ${URL_TO_TEST} | curl -F 'sprunge=<-' http://sprunge.us
echo "weighttp ${URL_TO_TEST} -n 1000000 -c 1000 -k"
weighttp ${URL_TO_TEST} -n 1000000 -c 50 -k | curl -F 'sprunge=<-' http://sprunge.us

URL_TO_TEST=${HTML100KB}
echo "running wrk -c40000 -d300s ${URL_TO_TEST}"
wrk -c40000 -d300s ${URL_TO_TEST} | curl -F 'sprunge=<-' http://sprunge.us
echo "ab -r -k -n 1000000 -c 50 -g /root/plot -e /root/csvs ${URL_TO_TEST}"
ab -r -k -n 1000000 -c 50 -g /root/plot -e /root/csvs ${URL_TO_TEST} | curl -F 'sprunge=<-' http://sprunge.us
echo "weighttp ${URL_TO_TEST} -n 1000000 -c 1000 -k"
weighttp ${URL_TO_TEST} -n 1000000 -c 50 -k | curl -F 'sprunge=<-' http://sprunge.us

URL_TO_TEST=${HTML1MB}
echo "running wrk -c40000 -d300s ${URL_TO_TEST}"
wrk -c40000 -d300s ${URL_TO_TEST} | curl -F 'sprunge=<-' http://sprunge.us
echo "ab -r -k -n 1000000 -c 50 -g /root/plot -e /root/csvs ${URL_TO_TEST}"
ab -r -k -n 1000000 -c 50 -g /root/plot -e /root/csvs ${URL_TO_TEST} | curl -F 'sprunge=<-' http://sprunge.us
echo "weighttp ${URL_TO_TEST} -n 1000000 -c 1000 -k"
weighttp ${URL_TO_TEST} -n 1000000 -c 50 -k | curl -F 'sprunge=<-' http://sprunge.us

URL_TO_TEST=${JS1KB}
echo "running wrk -c40000 -d300s ${URL_TO_TEST}"
wrk -c40000 -d300s ${URL_TO_TEST} | curl -F 'sprunge=<-' http://sprunge.us
echo "ab -r -k -n 1000000 -c 50 -g /root/plot -e /root/csvs ${URL_TO_TEST}"
ab -r -k -n 1000000 -c 50 -g /root/plot -e /root/csvs ${URL_TO_TEST} | curl -F 'sprunge=<-' http://sprunge.us
echo "weighttp ${URL_TO_TEST} -n 1000000 -c 1000 -k"
weighttp ${URL_TO_TEST} -n 1000000 -c 50 -k | curl -F 'sprunge=<-' http://sprunge.us

URL_TO_TEST=${JS10KB}
echo "running wrk -c40000 -d300s ${URL_TO_TEST}"
wrk -c40000 -d300s ${URL_TO_TEST} | curl -F 'sprunge=<-' http://sprunge.us
echo "ab -r -k -n 1000000 -c 50 -g /root/plot -e /root/csvs ${URL_TO_TEST}"
ab -r -k -n 1000000 -c 50 -g /root/plot -e /root/csvs ${URL_TO_TEST} | curl -F 'sprunge=<-' http://sprunge.us
echo "weighttp ${URL_TO_TEST} -n 1000000 -c 1000 -k"
weighttp ${URL_TO_TEST} -n 1000000 -c 50 -k | curl -F 'sprunge=<-' http://sprunge.us

URL_TO_TEST=${JS100KB}
echo "running wrk -c40000 -d300s ${URL_TO_TEST}"
wrk -c40000 -d300s ${URL_TO_TEST} | curl -F 'sprunge=<-' http://sprunge.us
echo "ab -r -k -n 1000000 -c 50 -g /root/plot -e /root/csvs ${URL_TO_TEST}"
ab -r -k -n 1000000 -c 50 -g /root/plot -e /root/csvs ${URL_TO_TEST} | curl -F 'sprunge=<-' http://sprunge.us
echo "weighttp ${URL_TO_TEST} -n 1000000 -c 1000 -k"
weighttp ${URL_TO_TEST} -n 1000000 -c 50 -k | curl -F 'sprunge=<-' http://sprunge.us

URL_TO_TEST=${JS1MB}
echo "running wrk -c40000 -d300s ${URL_TO_TEST}"
wrk -c40000 -d300s ${URL_TO_TEST} | curl -F 'sprunge=<-' http://sprunge.us
echo "ab -r -k -n 1000000 -c 50 -g /root/plot -e /root/csvs ${URL_TO_TEST}"
ab -r -k -n 1000000 -c 50 -g /root/plot -e /root/csvs ${URL_TO_TEST} | curl -F 'sprunge=<-' http://sprunge.us
echo "weighttp ${URL_TO_TEST} -n 1000000 -c 1000 -k"
weighttp ${URL_TO_TEST} -n 1000000 -c 50 -k | curl -F 'sprunge=<-' http://sprunge.us

URL_TO_TEST=${IMG1KB}
echo "running wrk -c40000 -d300s ${URL_TO_TEST}"
wrk -c40000 -d300s ${URL_TO_TEST} | curl -F 'sprunge=<-' http://sprunge.us
echo "ab -r -k -n 1000000 -c 50 -g /root/plot -e /root/csvs ${URL_TO_TEST}"
ab -r -k -n 1000000 -c 50 -g /root/plot -e /root/csvs ${URL_TO_TEST} | curl -F 'sprunge=<-' http://sprunge.us
echo "weighttp ${URL_TO_TEST} -n 1000000 -c 1000 -k"
weighttp ${URL_TO_TEST} -n 1000000 -c 50 -k | curl -F 'sprunge=<-' http://sprunge.us

URL_TO_TEST=${IMG10KB}
echo "running wrk -c40000 -d300s ${URL_TO_TEST}"
wrk -c40000 -d300s ${URL_TO_TEST} | curl -F 'sprunge=<-' http://sprunge.us
echo "ab -r -k -n 1000000 -c 50 -g /root/plot -e /root/csvs ${URL_TO_TEST}"
ab -r -k -n 1000000 -c 50 -g /root/plot -e /root/csvs ${URL_TO_TEST} | curl -F 'sprunge=<-' http://sprunge.us
echo "weighttp ${URL_TO_TEST} -n 1000000 -c 1000 -k"
weighttp ${URL_TO_TEST} -n 1000000 -c 50 -k | curl -F 'sprunge=<-' http://sprunge.us

URL_TO_TEST=${IMG100KB}
echo "running wrk -c40000 -d300s ${URL_TO_TEST}"
wrk -c40000 -d300s ${URL_TO_TEST} | curl -F 'sprunge=<-' http://sprunge.us
echo "ab -r -k -n 1000000 -c 50 -g /root/plot -e /root/csvs ${URL_TO_TEST}"
ab -r -k -n 1000000 -c 50 -g /root/plot -e /root/csvs ${URL_TO_TEST} | curl -F 'sprunge=<-' http://sprunge.us
echo "weighttp ${URL_TO_TEST} -n 1000000 -c 1000 -k"
weighttp ${URL_TO_TEST} -n 1000000 -c 50 -k | curl -F 'sprunge=<-' http://sprunge.us

URL_TO_TEST=${IMG1MB}
echo "running wrk -c40000 -d300s ${URL_TO_TEST}"
wrk -c40000 -d300s ${URL_TO_TEST} | curl -F 'sprunge=<-' http://sprunge.us
echo "ab -r -k -n 1000000 -c 50 -g /root/plot -e /root/csvs ${URL_TO_TEST}"
ab -r -k -n 1000000 -c 50 -g /root/plot -e /root/csvs ${URL_TO_TEST} | curl -F 'sprunge=<-' http://sprunge.us
echo "weighttp ${URL_TO_TEST} -n 1000000 -c 1000 -k"
weighttp ${URL_TO_TEST} -n 1000000 -c 50 -k | curl -F 'sprunge=<-' http://sprunge.us
