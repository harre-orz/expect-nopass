#!/bin/bash -ex

HOST=$1
export LOGIN_PASSWORD=$2

pass() {
  echo "[PASS]"
}

fail() {
  echo "[FAIL]"
  exit 1
}

./nopass ssh $HOST exit && pass || fail

./nopass ssh $HOST ls && pass || fail

./nopass scp ./nopass $HOST:/tmp/nopass && pass || fail

echo ls /tmp/nopass | ./nopass ssh $HOST bash -s && pass || fail

./nopass ssh $HOST bash -s <<EOF
rm /tmp/nopass
EOF
[ $? -eq 0 ] && pass || fail

env LOGIN_PASSWORD=abc ./nopass ssh $HOST ls && fail || pass

unset LOGIN_PASSWORD
./nopass ssh $HOST ls && fail || pass
