#!/bin/sh

#  sort-onlyPrimer.sh
#  
#
#  Created by Arthur Monjot on 27/02/2020.
#
cd ../dataPANAM
for f in $(ls V4-testPrimer/nonchimera-*.fastq.fasta)
do
    x=$(grep "^TTGG[CT][AG]AATGCTTTCGC.*TACCGCGGC[GT]GCTG[AG]CAC$" $f | wc -l)
    y=$(grep "^GTG[CT]CAGC[AC]GCCGCGGTA.*GCGAAAGCATT[CT][AG]CCAA$" $f | wc -l)
    w=$(cat $f | grep -v ">" | grep "N" | wc -l)
    z=$(echo $(($x+$y)))
    m=$(grep "^>" $f | wc -l)
    n=$(($z*100/$m))
    echo $f "- Sequences with primers : "$z "-" $n"%" "of total sequences -" $m "- and" $w "sequences with Ns" | cut -d"/" -f2 | sed 's/nonchimera-//g' |sed 's/_2_R1_clean.fastq.fasta//g' | tee -a V4-testPrimer/V4-primer.out
done
    
