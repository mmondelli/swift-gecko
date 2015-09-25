#!/bin/bash

threads=("128" "64" "32" "16" "8" "4" "2" "1")

for c in "${threads[@]}"; do

	sed "s/24/$c/g" swift.conf > swift$c.conf
	{ time swift -config swift$c.conf allvsall.swift; } 2>>time.txt
done
