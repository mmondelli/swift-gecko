#!/bin/bash

db=$1
runId=$2
app=$3

if [ $# != 3 ]; then
	echo "***ERROR*** Use: $0 database script_run_id app_name"
	exit -1
fi

SQLITE_CMD="sqlite3 -noheader -separator , -batch $db"
echo "$0 $db $runId $app"
echo "Running..." 
for i in $($SQLITE_CMD "select f.file_id from file f natural join staged_in s where s.app_exec_id like '%$runId%' and f.name like '%fragsF.INF%';")
do
  echo "$i"
  $SQLITE_CMD "WITH RECURSIVE anc(ancestor,descendant) AS (SELECT parent AS ancestor, child AS descendant FROM provenance_graph_edge WHERE child='$i' UNION SELECT provenance_graph_edge.parent AS ancestor, anc.descendant AS descendant FROM anc, provenance_graph_edge WHERE anc.ancestor=provenance_graph_edge.child) SELECT sum(real_secs) as cpu_time, (select sum(value) as fasta_length from file_annot_numeric where file_id='$i' and key like 'seq%length') as length FROM anc, resource_usage where ancestor like '%$app%' and ancestor=resource_usage.app_exec_id;" >> time_length_$runId\_$app.csv
done




