#!/bin/bash

cd ..
for x in $(echo dataPANAM/V*)
do
    for f in $(ls $x/*.fastq)
    do
        rename=$(echo "$f" | awk -F"_" '{ print $2"_"$3"_R"$4"_"$6 }')
        mv $f $x/$rename
        echo $rename
    done
done
