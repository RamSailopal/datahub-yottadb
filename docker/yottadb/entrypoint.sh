#!/bin/bash
apt-get update
apt-get install -y python3 python3-pip
pip install 'acryl-datahub[datahub-rest]'
source $(pkg-config --variable=prefix yottadb)/ydb_env_set
/opt/yottadb/current/ydb <<< 'H'
(echo "D ^%GI";echo "/home/entrypoint/meta.go";echo "") | /opt/yottadb/current/ydb
sleep 180
cp /home/entrypoint/*.m /data/r1.34_x86_64/r
/opt/yottadb/current/ydb <<< 'ZL "meta.m"'
/opt/yottadb/current/ydb <<< 'D PROC^meta("yottadb.text_data.test")'
tail -f /dev/null
