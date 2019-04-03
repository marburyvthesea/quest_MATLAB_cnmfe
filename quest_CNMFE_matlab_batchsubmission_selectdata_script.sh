#!/bin/bash
#MSUB -A p30771
#MSUB -q normal
#MSUB -l walltime=12:00:00
#MSUB -M johnjmarshall@u.northwestern.edu
#MSUB -j oe
#MSUB -N matlab_batch_cnmfe_run
#MSUB -l nodes=1:ppn=12


#pass folder path as 1st command line argument

FOLDER_path=$1

echo The folder to search is 
echo $FOLDER_path

cd ~
#add project directory to PATH
export PATH=$PATH/projects/p30771/


#load modules to use
module load matlab/r2018a

#cd to script directory

cd /projects/p30771/MATLAB/CNMF_E/quest_analysis/quest_MATLAB_cnmfe
#run  

#takes folder path as input to batch run and then find files in the input folder
# matlab -nosplash -nodesktop -r "folder_path=$FOLDER_path;disp(folder_path);run('/projects/p30771/MATLAB/CNMF_E/quest_analysis/quest_MATLAB_cnmfe/batch_run_with_input_data_jjm_script(folder_path)');exit;"


matlab -nosplash -nodesktop -r "folder_path='$FOLDER_path';disp(folder_path);exit;"


