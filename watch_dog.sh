#!/bin/bash
grep "Failed password" /var/log/auth.log | grep -v grep | awk '{ print $(NF-3)}'  | sort -n | uniq -c | sort -k 1nr | awk '{if ($1 > 3) print "sshd:"$2":deny"}' > /tmp/new.ip
grep -E "sshd:.*:deny" /etc/hosts.deny | grep -v "^#" > /tmp/old.ip
grep -E "^#" /etc/hosts.deny > /tmp/hosts.deny
mv /tmp/hosts.deny /etc/hosts.deny
cat /tmp/new.ip /tmp/old.ip | sort | uniq >> /etc/hosts.deny
service sshd restart

