#!/bin/bash
#SBATCH -A p30771
#SBATCH -p short
#SBATCH -t 0:05:00
#SBATCH --mem=90G
#SBATCH -N 1
#SBATCH -n 20 
#SBATCH --array=1-6%6 # run 6 jobs simultaneously with 6 lines of input file
#SBATCH --error=arrayJob_%A_%a.err
#SBATCH --output=arrayJob_%A_%a.out
#SBATCH --job-name="slurm_matlab_cnmfe_run_batch_array"

module purge all
module load anaconda3/2018.12

cd ~

#path to file (h5 or tiff should work)

#FILE_path=$1

# other parameters for CNMF_E

#INPUT_gSig=7
#INPUT_gSiz=21
#INPUT_Fs=20
#spatial downsampling 
#INPUT_ssub=2
#use parallel processing
#INPUT_parallel_enable=false

#add project directory to PATH
#export PATH=$PATH/projects/p30771/

#load modules to use
#module load python/anaconda3.6 

#load modules to use
#module load matlab/r2018a

#cd to script directory
cd /projects/p30771/MATLAB/CNMF_E_jjm/quest_MATLAB_cnmfe
#run  
python batcharrayscript.py $(sed -n ${SLURM_ARRAY_TASK_ID}p input.csv | sed 's/,/;/g')
#matlab -nosplash -nodesktop -r "file_to_analyze='$FILE_path';gSig='$INPUT_gSig';gSiz='$INPUT_gSiz';Fs='$INPUT_Fs';ssub='$INPUT_ssub';parallel_enable='$INPUT_parallel_enable';disp(file_to_analyze);run('/projects/p30771/MATLAB/CNMF_E_jjm/quest_MATLAB_cnmfe/jjm_run_from_command_line.m');exit;"


