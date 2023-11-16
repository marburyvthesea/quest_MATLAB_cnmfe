#!/bin/bash
#SBATCH -A p30771
#SBATCH -p short
#SBATCH -t 00:30:00
#SBATCH -o /projects/p30771/MATLAB/CNMF_E_jjm/quest_MATLAB_cnmfe/logfiles/slurm.%x-%j.out # STDOUT
#SBATCH --job-name="mmap_to_h5py"
#SBATCH -N 1
#SBATCH -n 5
#SBATCH --mem=100G

cd ~

#add project directory to PATH
export PATH=$PATH/projects/p30771/

#inputs
INPUT_folder=$1
INPUT_batchsize=$2
INPUT_procs=$3

#load modules to use
module load python/anaconda3.6 

#need to cd to load conda environment

cd /projects/p30771/pythonenvs/CaImAn/
source activate caiman

#need to cd to module directory

cd /home/jma819/caiman_quest/demos/notebooks/caiman_analysis

#inputs are path to directory containing files, number of processors to use and length of batches to concactenate into one file

python mmap_to_h5py.py $INPUT_folder $INPUT_batchsize $INPUT_procs 
