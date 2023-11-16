#!/bin/bash
#SBATCH -A p30771
#SBATCH -p normal
#SBATCH -t 24:00:00
#SBATCH -o ./logfiles/slurm.%x-%j.out # STDOUT
#SBATCH --job-name="slurm_matlab_cnmfe_batch_run"
#SBATCH --mem-per-cpu=4500M
#SBATCH -N 1
#SBATCH -n 35
#SBATCH --mail-type=ALL
#SBATCH --mail-user=jjm2128@gmail.com

module purge all

cd ~

#path to file (h5 or tiff should work)

INPUT_files_to_analyze=$1
echo $INPUT_files_to_analyze

#parameters for CNMF_E

INPUT_gSig=12
INPUT_gSiz=40
INPUT_Fs=20
#spatial downsampling 
INPUT_ssub=4
#minimum local correlation and peak to noise ratio for seeding pixels
INPUT_min_corr='0.9'
INPUT_min_pnr=18 
#deconvolution parameters
INPUT_deconvolution_type='constrained'
#use parallel processing
INPUT_parallel_enable=true
#number of frames in batch
INPUT_frame_size=5000

#add project directory to PATH
export PATH=$PATH/projects/p30771/

#load modules to use
module load python/anaconda3.6 

#load modules to use
module load matlab/r2018a

#cd to script directory
cd /projects/p30771/MATLAB/CNMF_E_jjm/quest_MATLAB_cnmfe
#run  


matlab -nosplash -nodesktop -r "addpath(genpath('/projects/p30771/MATLAB/CNMF_E_jjm'));files_to_analyze=$INPUT_files_to_analyze;gSig='$INPUT_gSig';gSiz='$INPUT_gSiz';Fs='$INPUT_Fs';ssub='$INPUT_ssub';min_corr=$INPUT_min_corr;min_pnr=$INPUT_min_pnr;deconvolution_type='$INPUT_deconvolution_type';parallel_enable='$INPUT_parallel_enable';frame_size='$INPUT_frame_size';run('/projects/p30771/MATLAB/CNMF_E_jjm/quest_MATLAB_cnmfe/jjm_batch_run_from_command_line.m');exit;"



