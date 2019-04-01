% path to tiff or hdf5 file

file_to_analyze = '/projects/p30771/miniscope/data/GRIN011/1_24_2019/H10_M19_S59/TIFs/caiman_analysis/memmap_0008_d1_480_d2_752_d3_1_order_C_frames_1000__resized.h5' ;

% add file to path and CNMFE repositories

addpath(file_to_analyze) ;
addpath(genpath('/projects/p30771/MATLAB/CNMF_E')) ;

% run script with options

cd('/projects/p30771/MATLAB/CNMF_E/quest_analysis/quest_MATLAB_cnmfe');

run_cnmfe_matlab_jjm(file_to_analyze, 13, 40, 20, false) ;

disp('finished cnmfe run') 
