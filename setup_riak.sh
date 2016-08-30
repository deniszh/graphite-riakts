#!/bin/bash

wget http://s3.amazonaws.com/downloads.basho.com/riak_ts/1.4/1.4.0/ubuntu/trusty/riak-ts_1.4.0-1_amd64.deb -O /vagrant/download/riak-ts_1.4.0-1_amd64.deb

if [ -e /vagrant/download/riak-ts_1.4.0-1_amd64.deb ]; then
  dpkg -i /vagrant/download/riak-ts_1.4.0-1_amd64.deb
  perl -pi -e 's/search =.*/search = on/' /etc/riak/riak.conf
  cat <<EOFLIMIT>/etc/security/limits.d/riak.conf
riak soft nofile 65536
riak hard nofile 65536
EOFLIMIT

  cat <<EOFPAM>>/etc/pam.d/common-session
session    required   pam_limits.so
EOFPAM

  service riak start
  ./bin/init_riakts.py

else
  echo "ERROR: riak-ts_1.4.0-1_amd64.deb not found in /vagrant/download"
fi