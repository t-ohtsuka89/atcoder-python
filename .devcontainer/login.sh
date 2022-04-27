#!/bin/bash

if [ $# -ne 2 ]; then
  echo "指定された引数は$#個です。"
  echo "sh login.sh <USER_NAME> <PASSWORD>"
  exit 1
fi

USERNAME=$1
PASSWORD=$2

echo "Login ACC"
expect -c "
set timeout 10
spawn acc login
expect \"username:\"
send \"${USERNAME}\n\"
expect \"password:*\"
send \"${PASSWORD}\n\"
interact
"

echo "Login OJ"
expect -c "
set timeout 10
spawn oj login https://beta.atcoder.jp/
expect \"Username:\" 
send \"${USERNAME}\n\"
expect \"Password:\"
send \"${PASSWORD}\n\"
interact
"