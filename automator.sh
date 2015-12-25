#!/usr/local/bin/bash
ARRAY=(10 50 100 250 500 750 1000 1250 1500  1750 2000 2250 2500)
for a in ${ARRAY[*]}
do
    for b in {1..10}
    do
	./algorithms_osx -2 $a
    done
done
