#!/bin/bash
#SBATCH -A p30771
#SBATCH -p short 
#SBATCH -t 01:00:00
#SBATCH -o /projects/p30771/MATLAB/CNMF_E_jjm/quest_MATLAB_cnmfe/logfiles/slurm.%x-%j.out # STDOUT
#SBATCH --job-name="fix_mat_files"
#SBATCH --mem-per-cpu=5200M
#SBATCH -N 1
#SBATCH -n 16


module purge all

cd ~

#path to matlab output file
FILE_path=$1

#add project directory to PATH
export PATH=$PATH/projects/p30771/

#load modules to use
module load matlab/r2018a

#cd to script directory
cd /projects/p30771/MATLAB/CNMF_E_jjm/quest_MATLAB_cnmfe
#run  

matlab -nosplash -nodesktop -r "file_to_analyze='$FILE_path';addpath(genpath('/projects/p30771/MATLAB/CNMF_E_jjm/'));load(file_to_analyze);neuron_out=struct(neuron);neuron_out.batches=[];save(strcat(file_to_analyze(1:end-4),'_out.mat'),'-v6','-struct','neuron_out');exit;"


