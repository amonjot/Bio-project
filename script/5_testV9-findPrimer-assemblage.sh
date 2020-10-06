#!/bin/bash

#  Script.sh
#
#
#  Created by Arthur Monjot on 24/01/2020.
#

# Boucle for
cd ..
cp -r dataPANAM/V9 dataPANAM/V9-testPrimer

for f in $(echo dataPANAM/V9-testPrimer)
do
    for fichier in $(ls $f/*_R1_*.fastq)
    do
        echo $fichier
        reverse=$(echo $fichier | sed 's/R1/R2/g')
        echo $reverse
    
        label=$(echo $fichier | awk -F"/" '{ print $3}' |sed -E 's/(F.*_)S.*.fastq$/\1/')
        echo $label
        
#Assemblage
        vsearch -fastq_mergepairs $fichier -reverse $reverse -fastq_maxmergelen 300 -fastq_minlen 100 -fastq_minovlen 50 -fastq_maxdiffs 0 -fastqout $f/assemble.fastq
#filter
        vsearch -fastq_filter $f/assemble.fastq -fastaout $f/assemble.fasta -relabel $label\_ -fasta_width 0
#chimère
        vsearch -uchime_denovo $f/assemble.fasta -nonchimeras $f/nonchimera-$label.fasta -fasta_width 0
    done
done

