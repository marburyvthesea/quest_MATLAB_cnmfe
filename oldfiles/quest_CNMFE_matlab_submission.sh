#!/bin/bash
#MSUB -A p30771
#MSUB -q normal 
#MSUB -l walltime=48:00:00
#MSUB -M johnjmarshall@u.northwestern.edu
#MSUB -j oe
#MSUB -N matlab_cnmfe_run
#MSUB -l nodes=1:ppn=2
##MSUB -l mem=120gb

cd ~

#path to file (h5 or tiff should work)

FILE_path=$1

# other parameters for CNMF_E

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

matlab -nosplash -nodesktop -r "file_to_analyze='$FILE_path';gSig='$INPUT_gSig';gSiz='$INPUT_gSiz';Fs='$INPUT_Fs';ssub='$INPUT_ssub';parallel_enable='$INPUT_parallel_enable';disp(file_to_analyze);run('/projects/p30771/MATLAB/CNMF_E/quest_analysis/quest_MATLAB_cnmfe/jjm_run_from_command_line.m');exit;"


