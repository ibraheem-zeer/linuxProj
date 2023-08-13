#!/bin/bash



logs="/var/log"
data="ibraaheemzeer@ibraaheemzeer-Legion-5-Pro-16ACH6H:~/Downloads/data.txt"
DBXCLI="ibraaheemzeer@ibraaheemzeer-Legion-5-Pro-16ACH6H:~/Downloads/dbxcli-linux-amd64"


current_date=$(date +"%Y-%m-%dT%H-%M")

last_hour=$(date -d "1 hour ago" +"%Y-%m-%dT%H:%M:%S")


log_file="kernel-logs-$current_date.txt"
compressed_file="kernel-logs-$current_date.tar.bz2"

journalctl --since "$last_hour" > "$log_file"

tar -cvjf "$compressed_file" "$log_file"

$DBXCLI upload "$data/$compressed_file" "/Dropbox/"

rm "$log_file"

