#!/bin/bash
#SBATCH -A p30771
#SBATCH -p normal
#SBATCH -t 12:00:00
#SBATCH --job-name="slurm_matlab_cnmfe_run"
#SBATCH -N 1
#SBATCH -n 20 
#SBATCH --mem-per-cpu=6000

module purge all

cd ~

#path to file (h5 or tiff should work)

FILE_path=$1

# other parameters for CNMF_E

INPUT_gSig=13
INPUT_gSiz=40
INPUT_Fs=20
#spatial downsampling 
INPUT_ssub=8
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

matlab -nosplash -nodesktop -r "file_to_analyze='$FILE_path';gSig='$INPUT_gSig';gSiz='$INPUT_gSiz';Fs='$INPUT_Fs';ssub='$INPUT_ssub';parallel_enable='$INPUT_parallel_enable';disp(file_to_analyze);run('/projects/p30771/MATLAB/CNMF_E/quest_analysis/quest_MATLAB_cnmfe/jjm_run_from_command_line.m');exit;"


