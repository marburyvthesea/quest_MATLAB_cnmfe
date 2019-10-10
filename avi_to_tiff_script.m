




% add file to path and CNMFE repositories

addpath(dirpath) ;
addpath(genpath('/projects/p30771/MATLAB/CNMF_E_jjm/')) ;

% run script with options

cd('/projects/p30771/MATLAB/CNMF_E_jjm/quest_MATLAB_cnmfe/');

fn_directory_to_multitiff(dirpath, movie_start, movie_end, parallel) ;
