#!/bin/bash

db=$1
runId=$2

if [ $# != 2 ]; then
	echo "***ERROR*** Use: $0 database script_run_id"
	exit -1
fi

SQLITE_CMD="sqlite3 $db"

for i in $(ls *.fasta)
do
  #echo $i
  id=$(echo "select distinct file_id from file f natural join staged_in s where f.name like '$i' and s.app_exec_id like '%$runId%';" | $SQLITE_CMD)
  #echo $id
  token1=$(echo $line | head -1 $i | awk '{print $1}' | cut -f 2 -d '>')
  token2=$(echo $line | head -1 $i | awk  '{print $2, $3}')
  token3=$(echo $line | head -1 $i | awk '{print $1}' | cut -f 4 -d '|' | cut -f 1 -d '.') #accession
  token4=$(echo $line | head -1 $i | awk '{print $1}' | cut -f 4 -d '|' | cut -f 2 -d '.') #version
  echo "INSERT INTO file_annot_text VALUES ('$id', 'specie', '$token2');" | $SQLITE_CMD
  echo "INSERT INTO file_annot_text VALUES ('$id', 'accession', '$token3');" | $SQLITE_CMD
  echo "INSERT INTO file_annot_text VALUES ('$id', 'version', '$token4');" | $SQLITE_CMD
done

