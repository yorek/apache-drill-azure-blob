#/bin/bash

sed -i 's/localhost/zookeeper-service/g' /opt/drill/conf/drill-override.conf
sleep 5 ; /opt/drill/bin/drillbit.sh restart

while true; do sleep 5; done