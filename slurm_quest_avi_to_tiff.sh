#!/bin/bash
#SBATCH -A p30771
#SBATCH -p short 
#SBATCH -t 00:20:00
#SBATCH -o /projects/p30771/MATLAB/CNMF_E_jjm/quest_MATLAB_cnmfe/logfiles/slurm_avi_to_tiff.%x-%j.out # STDOUT
#SBATCH --job-name="slurm_matlab_avi_to_tiff"
#SBATCH --mem=20G
#SBATCH -N 1
#SBATCH -n 5 


module purge all

cd ~

# Inputs from command line
DIR_path=$1

INPUT_moviestart=$2
# automatically runs to final movie in directory
#INPUT_movieend=$3
INPUT_parallel_enable=true
# switch for v4 movies
INPUT_v4=true


#add project directory to PATH
export PATH=$PATH/projects/p30771/

#load modules to use
module load gstreamer/1.14
module load matlab/r2021b

#cd to script directory
cd /projects/p30771/MATLAB/CNMF_E_jjm/quest_MATLAB_cnmfe
#run  

matlab -nosplash -nodesktop -r "dirpath='$DIR_path';movie_start='$INPUT_moviestart';v4='$INPUT_v4';filelist=dir(fullfile(dirpath));movie_end=num2str(size(filelist,1));parallel='$INPUT_parallel_enable';disp(dirpath);run('/projects/p30771/MATLAB/CNMF_E_jjm/quest_MATLAB_cnmfe/avi_to_tiff_script.m');exit;"
