#!/bin/bash
echo master.kiwenlau.com > /usr/local/hadoop/etc/hadoop/slaves;
for i in  $(seq $(serf members|grep slave|wc -l)) ; do echo slave$i.kiwenlau.com >> /usr/local/hadoop/etc/hadoop/slaves ; done;
cat /etc/hosts|grep -v hadoop|grep -v master > /tmp/hosts
cat /tmp/hosts > /etc/hosts
serf members |awk -F :7946 '{print $1}'|awk '{print $2 "\t" $1}'>> /etc/hosts;
serf members |grep master|awk -F :  '{print $1}'|awk '{print $2"\t master.kiwenlau.com"}' >> /etc/hosts;
cc=0;cat /etc/hosts|grep hadoop-slave|while read line ; do ((cc++)); echo $line slave$cc.kiwenlau.com >> /etc/hosts; done;
cat /usr/local/hadoop/etc/hadoop/slaves|grep slave|while read line ; do  scp -o StrictHostKeyChecking=no /etc/hosts $line:/etc/hosts;  done;


