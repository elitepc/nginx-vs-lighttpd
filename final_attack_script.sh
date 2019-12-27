#! /bin/bash

SERVER="http://10.1.0.9:80/"
HTML="html/"
JS="js/"
IMG="img/"
_1B="1B"
_1KB="1KB"
_10KB="10KB"
_100KB="100KB"
_1MB="1MB"
HTML_EXTENSION=".html"
JS_EXTENSION=".js"
PNG_EXTENSION=".png"


HTML1B="${SERVER}${HTML}${_1B}${HTML_EXTENSION}"
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

PHPMICROSECONDS="${SERVER}php/date.php"

#apt-get update
#apt-get install apache2-utils -y
ulimit 500000
ulimit -n 500000
ulimit -u 500000
URL_TO_TEST=${HTML1B}
# echo ${HTML1B}
# echo "running wrk -c40000 -d30s ${URL_TO_TEST}"
# wrk -c500 -d30s ${URL_TO_TEST}
# echo "ab -r -k -n 100000 -c 500 -g /root/plot -e /root/csvs ${URL_TO_TEST}"
# ab -r -k -n 1000000 -c 500 -g /root/plot -e /root/csvs ${URL_TO_TEST}
# echo "weighttp ${URL_TO_TEST} -n 1000000 -c 500 -k"
# weighttp ${URL_TO_TEST} -n 100000 -c 500 -k
test_with_wrk_for_5_minutes_5_times () {
  # $1 = threads
  # $2 = concurrent users
  # $3 = URL
  echo "${2} concurrent"
  for i in {1..5}
  do
    echo "iteration: $i"
    echo "wrk -c$2 -t $1 -d300s $3"
    sleep 5
    wrk -c$2 -t $1 -d300s $3
  done
}

test_with_apache_bench_for_1_million_requests_5_times () {
  # $1 = threads
  # $2 = concurrent users
  # $3 = URL
  echo "${2} concurrent"
  for i in {1..5}
  do
    echo "iteration: $i"
    sleep 5
    ab -r -k -n 1000000 -c ${2} ${3}
  done
}

test_from_1_concurrent_user_until_4096_with_wrk_and_apache_bench () {
  # $1 = URL
  echo "how many requests can you serve in 5 minutes?"
  URL=$1
  test_with_wrk_for_5_minutes_5_times 1 1 $URL
  for NUMBER_OF_CONCURRENT_USERS in 1 2 4 8 16 32 64 128 256 512 1024 2048 4096
  do
    test_with_wrk_for_5_minutes_5_times 2 $NUMBER_OF_CONCURRENT_USERS $URL
  done

  echo "how much time does it take to process 1 million requests?"
  echo "apache bench"
  for NUMBER_OF_CONCURRENT_USERS in 1 2 4 8 16 32 64 128 256 512 1024 2048 4096
  do
    test_with_apache_bench_for_1_million_requests_5_times 2 $NUMBER_OF_CONCURRENT_USERS $URL
  done
}

test_from_1_concurrent_user_until_4096_with_wrk_and_apache_bench ${HTML1B}
test_from_1_concurrent_user_until_4096_with_wrk_and_apache_bench ${JS100KB}
test_from_1_concurrent_user_until_4096_with_wrk_and_apache_bench ${IMG1MB}
test_from_1_concurrent_user_until_4096_with_wrk_and_apache_bench ${PHPMICROSECONDS}