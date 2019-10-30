#!/bin/bash
#SBATCH -A p30771
#SBATCH -p short 
#SBATCH -t 2:00:00
#SBATCH -o ./logfiles/slurm.%x-%j.out # STDOUT
#SBATCH --job-name="slurm_matlab_cnmfe_batch_run"
#SBATCH --mem=90G
#SBATCH -N 1
#SBATCH -n 20 

module purge all

cd ~

#path to file (h5 or tiff should work)

#add project directory to PATH
export PATH=$PATH/projects/p30771/

#load modules to use
module load python/anaconda3.6 

#load modules to use
module load matlab/r2018a

#cd to script directory
cd /projects/p30771/MATLAB/CNMF_E/quest_analysis/quest_MATLAB_cnmfe
#run  

matlab -nosplash -nodesktop -r "addpath(genpath('/projects/p30771/MATLAB/CNMF_E'));run('/projects/p30771/MATLAB/CNMF_E/quest_analysis/quest_MATLAB_cnmfe/demo_batch_1p.m');exit;"


