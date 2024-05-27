#insilicoseq install  version: insilicoseq 1.6.0
#https://github.com/HadrienG/InSilicoSeq
conda install -c bioconda insilicoseq
conda activate insilicoseq

#build 20 bacteria
iss generate --ncbi bacteria -U 20 --model hiseq --output hiseq_ncbi_1 --n_reads 10m

#build 10 samples
iss generate --ncbi bacteria -U 20 --model hiseq --output hiseq_ncbi_2 --n_reads 10m
iss generate --ncbi bacteria -U 20 --model hiseq --output hiseq_ncbi_3 --n_reads 10m
iss generate --ncbi bacteria -U 20 --model hiseq --output hiseq_ncbi_4 --n_reads 10m
iss generate --ncbi bacteria -U 20 --model hiseq --output hiseq_ncbi_5 --n_reads 10m
iss generate --ncbi bacteria -U 20 --model hiseq --output hiseq_ncbi_6 --n_reads 10m
iss generate --ncbi bacteria -U 20 --model hiseq --output hiseq_ncbi_7 --n_reads 10m
iss generate --ncbi bacteria -U 20 --model hiseq --output hiseq_ncbi_8 --n_reads 10m
iss generate --ncbi bacteria -U 20 --model hiseq --output hiseq_ncbi_9 --n_reads 10m
iss generate --ncbi bacteria -U 20 --model hiseq --output hiseq_ncbi_10 --n_reads 10m

#kneaddata v0.12.0 FastQC v0.12.1 multiqc --version 1.13
conda activate kneaddata
#fastqc
time fastqc  *.fastq -t 2

#fastqc, export multiqc_report.html
multiqc -d seq/ -o result/qc -f
