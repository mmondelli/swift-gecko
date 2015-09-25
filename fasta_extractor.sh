#!/bin/bash

SQLITE_CMD="sqlite3 /home/mondelli/swift_provenance.db"

for i in $(ls *.fasta)
do
  echo $i
  id=$(echo "select file_id from file where name='$i';" | $SQLITE_CMD)
  echo $id
  token1=$(echo $line | head -1 $i | awk '{print $1}' | cut -f 2 -d '>')
  token2=$(echo $line | head -1 $i | awk  '{print $2, $3}')
  token3=$(echo $line | head -1 $i | awk '{print $1}' | cut -f 4 -d '|' | cut -f 1 -d '.') #accession
  token4=$(echo $line | head -1 $i | awk '{print $1}' | cut -f 4 -d '|' | cut -f 2 -d '.') #version
  echo "INSERT INTO file_annot_text VALUES ('$id', 'specie', '$token2');" | $SQLITE_CMD
  echo "INSERT INTO file_annot_text VALUES ('$id', 'accession', '$token3');" | $SQLITE_CMD
  echo "INSERT INTO file_annot_text VALUES ('$id', 'version', '$token4');" | $SQLITE_CMD
done

