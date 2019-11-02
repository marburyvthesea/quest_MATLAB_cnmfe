#!/bin/bash
#SBATCH -A p30771
#SBATCH -p normal 
#SBATCH -t 24:00:00
#SBATCH -o ./logfiles/slurm.%x-%j.out # STDOUT
#SBATCH --job-name="slurm_matlab_cnmfe_batch_run"
#SBATCH --mem=90G
#SBATCH -N 1
#SBATCH -n 20 

module purge all

cd ~

#path to file (h5 or tiff should work)

#parameters for CNMF_E

INPUT_gSig=7
INPUT_gSiz=21
INPUT_Fs=20
#spatial downsampling 
INPUT_ssub=2
#use parallel processing
INPUT_parallel_enable=false


#add project directory to PATH
export PATH=$PATH/projects/p30771/

#load modules to use
module load python/anaconda3.6 

#load modules to use
module load matlab/r2018a

#cd to script directory
cd /projects/p30771/MATLAB/CNMF_E/quest_analysis/quest_MATLAB_cnmfe
#run  

matlab -nosplash -nodesktop -r "addpath(genpath('/projects/p30771/MATLAB/CNMF_E'));gSig='$INPUT_gSig';gSiz='$INPUT_gSiz';Fs='$INPUT_Fs';ssub='$INPUT_ssub';parallel_enable='$INPUT_parallel_enable';run('/projects/p30771/MATLAB/CNMF_E/quest_analysis/quest_MATLAB_cnmfe/jjm_batch_run_from_command_line.m');exit;"


