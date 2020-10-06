#!/bin/sh

#  sort.sh
#  
#
#  Created by Arthur Monjot on 26/02/2020.
#  
cd ..
mkdir dataPANAM
mkdir dataPANAM/V4
mkdir dataPANAM/V9
for V in V4 V9
do
    for sample in $(ls rawdata/$V)
    do
        cp rawdata/$V/$sample/*.fastq dataPANAM/$V
    done
done
