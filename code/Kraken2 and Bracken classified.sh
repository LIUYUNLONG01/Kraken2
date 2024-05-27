
# kraken2 / Bracken reference database index
##minikraken
wget https://genome-idx.s3.amazonaws.com/kraken/minikraken2_v1_8GB_201904.tgz

##standard-16
wget https://genome-idx.s3.amazonaws.com/kraken/k2_standard_16gb_20240112.tar.gz

##standard
wget https://genome-idx.s3.amazonaws.com/kraken/k2_standard_20240112.tar.gz

##nt
wget https://genome-idx.s3.amazonaws.com/kraken/k2_nt_20231129.tar.gz

##GTDB r202
wget http://ftp.tue.mpg.de/ebio/projects/struo2/GTDB_release202/kraken2/


# kraken2 / Bracken classified
## minikraken database
#!/bin/bash
#SBATCH --job-name="kraken2"
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=00-12:00:00
#SBATCH --ntasks-per-node=32
#SBATCH --mem=0
#SBATCH --mail-user=liuyunlong9438@gmail.com
#SBATCH --account=def-guanuofa
#SBATCH --array=0-9 # job array index

module load StdEnv/2020
module load gcc/9.3.0
module load kraken2

# Define different confidence scores
CS_VALUES=(0 0.2 0.4 0.6 0.8 1.0)

# Loop through each CS value
for CS in "${CS_VALUES[@]}"; do
  names=($(cat jobs))

  echo ${names[${SLURM_ARRAY_TASK_ID}]}

  kraken2 --db ~/scratch/liu/dataset/db/minikraken \
  --report ~/scratch/liu/dataset/result/kraken2/minikraken/$CS/${names[${SLURM_ARRAY_TASK_ID}]}.k2report \
  --output ~/scratch/liu/dataset/result/kraken2/minikraken/$CS/${names[${SLURM_ARRAY_TASK_ID}]}.out \
  --report-minimizer-data \
  --threads 20 \
  --confidence $CS \
  --paired ${names[${SLURM_ARRAY_TASK_ID}]}.R1.fastq ${names[${SLURM_ARRAY_TASK_ID}]}.R2.fastq
done

## standard-16 database
#!/bin/bash
#SBATCH --job-name="kraken2"
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=00-12:00:00
#SBATCH --ntasks-per-node=32
#SBATCH --mem=0
#SBATCH --mail-user=liuyunlong9438@gmail.com
#SBATCH --account=def-guanuofa
#SBATCH --array=0-9 # job array index

module load StdEnv/2020
module load gcc/9.3.0
module load kraken2

# Define different confidence scores
CS_VALUES=(0 0.2 0.4 0.6 0.8 1.0)

# Loop through each CS value
for CS in "${CS_VALUES[@]}"; do
  names=($(cat jobs))

  echo ${names[${SLURM_ARRAY_TASK_ID}]}

  kraken2 --db ~/scratch/liu/dataset/db/standard_16 \
  --report ~/scratch/liu/dataset/result/kraken2/standard_16/$CS/${names[${SLURM_ARRAY_TASK_ID}]}.k2report \
  --output ~/scratch/liu/dataset/result/kraken2/standard_16/$CS/${names[${SLURM_ARRAY_TASK_ID}]}.out \
  --report-minimizer-data \
  --threads 20 \
  --confidence $CS \
  --paired ${names[${SLURM_ARRAY_TASK_ID}]}.R1.fastq ${names[${SLURM_ARRAY_TASK_ID}]}.R2.fastq
done

## standard database
#!/bin/bash
#SBATCH --job-name="kraken2"
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=00-12:00:00
#SBATCH --ntasks-per-node=32
#SBATCH --mem=0
#SBATCH --mail-user=liuyunlong9438@gmail.com
#SBATCH --account=def-guanuofa
#SBATCH --array=0-9 # job array index

module load StdEnv/2020
module load gcc/9.3.0
module load kraken2

# Define different confidence scores
CS_VALUES=(0 0.2 0.4 0.6 0.8 1.0)

# Loop through each CS value
for CS in "${CS_VALUES[@]}"; do
  names=($(cat jobs))

  echo ${names[${SLURM_ARRAY_TASK_ID}]}

  kraken2 --db ~/scratch/liu/dataset/db/standard \
  --report ~/scratch/liu/dataset/result/kraken2/standard/$CS/${names[${SLURM_ARRAY_TASK_ID}]}.k2report \
  --output ~/scratch/liu/dataset/result/kraken2/standard/$CS/${names[${SLURM_ARRAY_TASK_ID}]}.out \
  --report-minimizer-data \
  --threads 20 \
  --confidence $CS \
  --paired ${names[${SLURM_ARRAY_TASK_ID}]}.R1.fastq ${names[${SLURM_ARRAY_TASK_ID}]}.R2.fastq
done

## nt database
#!/bin/bash
#SBATCH --job-name="kraken2"
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=00-12:00:00
#SBATCH --ntasks-per-node=32
#SBATCH --mem=0
#SBATCH --mail-user=liuyunlong9438@gmail.com
#SBATCH --account=def-guanuofa
#SBATCH --array=0-9 # job array index

module load StdEnv/2020
module load gcc/9.3.0
module load kraken2

# Define different confidence scores
CS_VALUES=(0 0.2 0.4 0.6 0.8 1.0)

# Loop through each CS value
for CS in "${CS_VALUES[@]}"; do
  names=($(cat jobs))

  echo ${names[${SLURM_ARRAY_TASK_ID}]}

  kraken2 --db ~/scratch/liu/dataset/db/nt \
  --report ~/scratch/liu/dataset/result/kraken2/nt/$CS/${names[${SLURM_ARRAY_TASK_ID}]}.k2report \
  --output ~/scratch/liu/dataset/result/kraken2/nt/$CS/${names[${SLURM_ARRAY_TASK_ID}]}.out \
  --report-minimizer-data \
  --threads 20 \
  --confidence $CS \
  --paired ${names[${SLURM_ARRAY_TASK_ID}]}.R1.fastq ${names[${SLURM_ARRAY_TASK_ID}]}.R2.fastq
done

## GTDB r202 database
#!/bin/bash
#SBATCH --job-name="kraken2"
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=00-12:00:00
#SBATCH --ntasks-per-node=32
#SBATCH --mem=300G
#SBATCH --mail-user=liuyunlong9438@gmail.com
#SBATCH --account=def-guanuofa
#SBATCH --array=0-9 # job array index

module load StdEnv/2020
module load gcc/9.3.0
module load kraken2

# Define different confidence scores
CS_VALUES=(0 0.2 0.4 0.6 0.8 1.0)

# Loop through each CS value
for CS in "${CS_VALUES[@]}"; do
  names=($(cat jobs))

  echo ${names[${SLURM_ARRAY_TASK_ID}]}

  kraken2 --db ~/scratch/liu/dataset/db/gtdb202 \
  --report ~/scratch/liu/dataset/result/kraken2/gtdb202/$CS/${names[${SLURM_ARRAY_TASK_ID}]}.k2report \
  --output ~/scratch/liu/dataset/result/kraken2/gtdb202/$CS/${names[${SLURM_ARRAY_TASK_ID}]}.out \
  --report-minimizer-data \
  --threads 20 \
  --confidence $CS \
  --paired ${names[${SLURM_ARRAY_TASK_ID}]}.R1.fastq ${names[${SLURM_ARRAY_TASK_ID}]}.R2.fastq
done


# Bracken species level

#!/bin/bash
#SBATCH --job-name="Bracken"
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=00-12:00:00
#SBATCH --ntasks-per-node=32
#SBATCH --mem=0
#SBATCH --mail-user=liuyunlong9438@gmail.com
#SBATCH --account=def-guanuofa
#SBATCH --array=0-9 # job array index

module load StdEnv/2020
module load gcc/9.3.0
module load bracken

# Define different confidence scores
CS_VALUES=(0 0.2 0.4 0.6 0.8 1.0)

# Loop through each CS value
for CS in "${CS_VALUES[@]}"; do
  names=($(cat jobs))

  echo ${names[${SLURM_ARRAY_TASK_ID}]}

  bracken --db ~/scratch/liu/dataset/db/minikraken \
  -i ${names[${SLURM_ARRAY_TASK_ID}]}.k2report \
  -o ~/scratch/liu/dataset/result/bracken/minikraken/$CS/species/${names[${SLURM_ARRAY_TASK_ID}]}.bracken \
  -w ~/scratch/liu/dataset/result/bracken/minikraken/$CS/species/${names[${SLURM_ARRAY_TASK_ID}]}.breport \
  -r 100 \
  -l S \
  -t 20
done

#!/bin/bash
#SBATCH --job-name="Bracken"
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=00-12:00:00
#SBATCH --ntasks-per-node=32
#SBATCH --mem=0
#SBATCH --mail-user=liuyunlong9438@gmail.com
#SBATCH --account=def-guanuofa
#SBATCH --array=0-9 # job array index

module load StdEnv/2020
module load gcc/9.3.0
module load bracken

# Define different confidence scores
CS_VALUES=(0 0.2 0.4 0.6 0.8 1.0)

# Loop through each CS value
for CS in "${CS_VALUES[@]}"; do
  names=($(cat jobs))

  echo ${names[${SLURM_ARRAY_TASK_ID}]}

  bracken --db ~/scratch/liu/dataset/db/standard_16 \
  -i ${names[${SLURM_ARRAY_TASK_ID}]}.k2report \
  -o ~/scratch/liu/dataset/result/bracken/standard_16/$CS/species/${names[${SLURM_ARRAY_TASK_ID}]}.bracken \
  -w ~/scratch/liu/dataset/result/bracken/standard_16/$CS/species/${names[${SLURM_ARRAY_TASK_ID}]}.breport \
  -r 100 \
  -l S \
  -t 20
done

#!/bin/bash
#SBATCH --job-name="Bracken"
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=00-12:00:00
#SBATCH --ntasks-per-node=32
#SBATCH --mem=0
#SBATCH --mail-user=liuyunlong9438@gmail.com
#SBATCH --account=def-guanuofa
#SBATCH --array=0-9 # job array index

module load StdEnv/2020
module load gcc/9.3.0
module load bracken

# Define different confidence scores
CS_VALUES=(0 0.2 0.4 0.6 0.8 1.0)

# Loop through each CS value
for CS in "${CS_VALUES[@]}"; do
  names=($(cat jobs))

  echo ${names[${SLURM_ARRAY_TASK_ID}]}

  bracken --db ~/scratch/liu/dataset/db/standard \
  -i ${names[${SLURM_ARRAY_TASK_ID}]}.k2report \
  -o ~/scratch/liu/dataset/result/bracken/standard/$CS/species/${names[${SLURM_ARRAY_TASK_ID}]}.bracken \
  -w ~/scratch/liu/dataset/result/bracken/standard/$CS/species/${names[${SLURM_ARRAY_TASK_ID}]}.breport \
  -r 100 \
  -l S \
  -t 20
done

#!/bin/bash
#SBATCH --job-name="Bracken"
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=00-12:00:00
#SBATCH --ntasks-per-node=32
#SBATCH --mem=0
#SBATCH --mail-user=liuyunlong9438@gmail.com
#SBATCH --account=def-guanuofa
#SBATCH --array=0-9 # job array index

module load StdEnv/2020
module load gcc/9.3.0
module load bracken

# Define different confidence scores
CS_VALUES=(0 0.2 0.4 0.6 0.8 1.0)

# Loop through each CS value
for CS in "${CS_VALUES[@]}"; do
  names=($(cat jobs))

  echo ${names[${SLURM_ARRAY_TASK_ID}]}

  bracken --db ~/scratch/liu/dataset/db/nt \
  -i ${names[${SLURM_ARRAY_TASK_ID}]}.k2report \
  -o ~/scratch/liu/dataset/result/bracken/nt/$CS/species/${names[${SLURM_ARRAY_TASK_ID}]}.bracken \
  -w ~/scratch/liu/dataset/result/bracken/nt/$CS/species/${names[${SLURM_ARRAY_TASK_ID}]}.breport \
  -r 100 \
  -l S \
  -t 20
done

#!/bin/bash
#SBATCH --job-name="Bracken"
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=00-12:00:00
#SBATCH --ntasks-per-node=32
#SBATCH --mem=300G
#SBATCH --mail-user=liuyunlong9438@gmail.com
#SBATCH --account=def-guanuofa
#SBATCH --array=0-9 # job array index

module load StdEnv/2020
module load gcc/9.3.0
module load bracken

# Define different confidence scores
CS_VALUES=(0 0.2 0.4 0.6 0.8 1.0)

# Loop through each CS value
for CS in "${CS_VALUES[@]}"; do
  names=($(cat jobs))

  echo ${names[${SLURM_ARRAY_TASK_ID}]}

  bracken --db ~/scratch/liu/dataset/db/gtdb202 \
  -i ${names[${SLURM_ARRAY_TASK_ID}]}.k2report \
  -o ~/scratch/liu/dataset/result/bracken/gtdb202/$CS/species/${names[${SLURM_ARRAY_TASK_ID}]}.bracken \
  -w ~/scratch/liu/dataset/result/bracken/gtdb202/$CS/species/${names[${SLURM_ARRAY_TASK_ID}]}.breport \
  -r 100 \
  -l S \
  -t 20
done

# Bracken phylum level

#!/bin/bash
#SBATCH --job-name="Bracken"
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=00-12:00:00
#SBATCH --ntasks-per-node=32
#SBATCH --mem=0
#SBATCH --mail-user=liuyunlong9438@gmail.com
#SBATCH --account=def-guanuofa
#SBATCH --array=0-9 # job array index

module load StdEnv/2020
module load gcc/9.3.0
module load bracken

# Define different confidence scores
CS_VALUES=(0 0.2 0.4 0.6 0.8 1.0)

# Loop through each CS value
for CS in "${CS_VALUES[@]}"; do
  names=($(cat jobs))

  echo ${names[${SLURM_ARRAY_TASK_ID}]}

  bracken --db ~/scratch/liu/dataset/db/minikraken \
  -i ${names[${SLURM_ARRAY_TASK_ID}]}.k2report \
  -o ~/scratch/liu/dataset/result/bracken/minikraken/$CS/phylum/${names[${SLURM_ARRAY_TASK_ID}]}.bracken \
  -w ~/scratch/liu/dataset/result/bracken/minikraken/$CS/phylum/${names[${SLURM_ARRAY_TASK_ID}]}.breport \
  -r 100 \
  -l P \
  -t 20
done

#!/bin/bash
#SBATCH --job-name="Bracken"
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=00-12:00:00
#SBATCH --ntasks-per-node=32
#SBATCH --mem=0
#SBATCH --mail-user=liuyunlong9438@gmail.com
#SBATCH --account=def-guanuofa
#SBATCH --array=0-9 # job array index

module load StdEnv/2020
module load gcc/9.3.0
module load bracken

# Define different confidence scores
CS_VALUES=(0 0.2 0.4 0.6 0.8 1.0)

# Loop through each CS value
for CS in "${CS_VALUES[@]}"; do
  names=($(cat jobs))

  echo ${names[${SLURM_ARRAY_TASK_ID}]}

  bracken --db ~/scratch/liu/dataset/db/standard_16 \
  -i ${names[${SLURM_ARRAY_TASK_ID}]}.k2report \
  -o ~/scratch/liu/dataset/result/bracken/standard_16/$CS/phylum/${names[${SLURM_ARRAY_TASK_ID}]}.bracken \
  -w ~/scratch/liu/dataset/result/bracken/standard_16/$CS/phylum/${names[${SLURM_ARRAY_TASK_ID}]}.breport \
  -r 100 \
  -l P \
  -t 20
done

#!/bin/bash
#SBATCH --job-name="Bracken"
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=00-12:00:00
#SBATCH --ntasks-per-node=32
#SBATCH --mem=0
#SBATCH --mail-user=liuyunlong9438@gmail.com
#SBATCH --account=def-guanuofa
#SBATCH --array=0-9 # job array index

module load StdEnv/2020
module load gcc/9.3.0
module load bracken

# Define different confidence scores
CS_VALUES=(0 0.2 0.4 0.6 0.8 1.0)

# Loop through each CS value
for CS in "${CS_VALUES[@]}"; do
  names=($(cat jobs))

  echo ${names[${SLURM_ARRAY_TASK_ID}]}

  bracken --db ~/scratch/liu/dataset/db/standard \
  -i ${names[${SLURM_ARRAY_TASK_ID}]}.k2report \
  -o ~/scratch/liu/dataset/result/bracken/standard/$CS/phylum/${names[${SLURM_ARRAY_TASK_ID}]}.bracken \
  -w ~/scratch/liu/dataset/result/bracken/standard/$CS/phylum/${names[${SLURM_ARRAY_TASK_ID}]}.breport \
  -r 100 \
  -l P \
  -t 20
done

#!/bin/bash
#SBATCH --job-name="Bracken"
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=00-12:00:00
#SBATCH --ntasks-per-node=32
#SBATCH --mem=0
#SBATCH --mail-user=liuyunlong9438@gmail.com
#SBATCH --account=def-guanuofa
#SBATCH --array=0-9 # job array index

module load StdEnv/2020
module load gcc/9.3.0
module load bracken

# Define different confidence scores
CS_VALUES=(0 0.2 0.4 0.6 0.8 1.0)

# Loop through each CS value
for CS in "${CS_VALUES[@]}"; do
  names=($(cat jobs))

  echo ${names[${SLURM_ARRAY_TASK_ID}]}

  bracken --db ~/scratch/liu/dataset/db/nt \
  -i ${names[${SLURM_ARRAY_TASK_ID}]}.k2report \
  -o ~/scratch/liu/dataset/result/bracken/nt/$CS/phylum/${names[${SLURM_ARRAY_TASK_ID}]}.bracken \
  -w ~/scratch/liu/dataset/result/bracken/nt/$CS/phylum/${names[${SLURM_ARRAY_TASK_ID}]}.breport \
  -r 100 \
  -l P \
  -t 20
done

#!/bin/bash
#SBATCH --job-name="Bracken"
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=00-12:00:00
#SBATCH --ntasks-per-node=32
#SBATCH --mem=300G
#SBATCH --mail-user=liuyunlong9438@gmail.com
#SBATCH --account=def-guanuofa
#SBATCH --array=0-9 # job array index

module load StdEnv/2020
module load gcc/9.3.0
module load bracken

# Define different confidence scores
CS_VALUES=(0 0.2 0.4 0.6 0.8 1.0)

# Loop through each CS value
for CS in "${CS_VALUES[@]}"; do
  names=($(cat jobs))

  echo ${names[${SLURM_ARRAY_TASK_ID}]}

  bracken --db ~/scratch/liu/dataset/db/gtdb202 \
  -i ${names[${SLURM_ARRAY_TASK_ID}]}.k2report \
  -o ~/scratch/liu/dataset/result/bracken/gtdb202/$CS/phylum/${names[${SLURM_ARRAY_TASK_ID}]}.bracken \
  -w ~/scratch/liu/dataset/result/bracken/gtdb202/$CS/phylum/${names[${SLURM_ARRAY_TASK_ID}]}.breport \
  -r 100 \
  -l p \
  -t 20
done
