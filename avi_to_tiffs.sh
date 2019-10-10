#!/bin/bash
#SBATCH -A p30771
#SBATCH -p normal
#SBATCH -t 01:00:00
#SBATCH --job-name="avi_to_multitiff"
#SBATCH -o ./logfiles/slurm.%x-%j.out # STDOUT
#SBATCH -N 1
#SBATCH -n 12
#SBATCH --mem-per-cpu=6000



DIR_path=$1
MOVIE_start=$2
MOVIE_end=$3
PARALLEL=False

#load modules to use
#module load matlab/r2018a


matlab -nosplash -nodesktop -r "addpath(DIR_path);fn_directory_to_multitiff(DIR_path, MOVIE_start, MOVIE_end, PARALLEL);"


