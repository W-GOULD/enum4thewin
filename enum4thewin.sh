#!/usr/bin/env bash

while read line
do
  grep '445/open' | awk '{ print $2 }' | sort -u | tee -a Hosts_smb.txt | for i in $(cat Hosts_smb);do enum4linux -a $i 
done < "${1:-/dev/stdin}"
