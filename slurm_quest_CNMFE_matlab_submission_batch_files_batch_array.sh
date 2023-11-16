#!/bin/bash
#SBATCH -A p30771
#SBATCH -p short
#SBATCH -t 0:05:00
#SBATCH --mem=90G
#SBATCH -N 1
#SBATCH -n 20 
#SBATCH --array=1-6 # run 6 jobs simultaneously with 6 lines of input file
#SBATCH --error=arrayJob_%A_%a.err
#SBATCH --output=arrayJob_%A_%a.out
#SBATCH --job-name="slurm_matlab_cnmfe_run_batch_array"

module purge all
#module load anaconda3/2018.12

cd ~

add project directory to PATH
export PATH=$PATH/projects/p30771

#load modules to use
module load python/anaconda3.6

#load modules to use
module load matlab/r2018a

#cd to script directory
cd /projects/p30771/MATLAB/CNMF_E_jjm/quest_MATLAB_cnmfe

#path to file (h5 or tiff should work)

INPUT_files_to_analyze=$1

# other parameters for CNMF_E
#if want to input different variables for job use ${SLURM_ARRAY_TASK_ID}p variable to get from input_args.csv file

IFS=$'\n' read -d '' -r -a input_args < input_args.txt

echo "running job with input variable"
echo $input_args[$SLURM_ARRAY_TAK_ID]

INPUT_gSig= $input_args[$SLURM_ARRAY_TAK_ID]
INPUT_gSiz=35
INPUT_Fs=20
#spatial downsampling 
INPUT_ssub=2
#use parallel processing
INPUT_parallel_enable=false
#number of frames in batch
INPUT_frame_size=5000
 
# run the script 

matlab -nosplash -nodesktop -r "addpath(genpath('/projects/p30771/MATLAB/CNMF_E_jjm'));files_to_analyze=$INPUT_files_to_analyze;gSig='$INPUT_gSig';gSiz='$INPUT_gSiz';Fs='$INPUT_Fs';ssub='$INPUT_ssub';parallel_enable='$INPUT_parallel_enable';frame_size='$INPUT_frame_size';run('/projects/p30771/MATLAB/CNMF_E_jjm/quest_MATLAB_cnmfe/jjm_batch_run_from_command_line.m');exit;"


