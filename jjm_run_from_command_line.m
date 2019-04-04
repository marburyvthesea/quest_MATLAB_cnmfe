
% get cnmfe params, change to numberic values
% path to tiff or hdf5 file
%file_to_analyze 
gSig = str2num(gSig) ; 
gSiz = str2num(gSiz) ; 
Fs = str2num(Fs) ;
ssub = str2num(ssub) ;  


%find all appropriate hdf files in the folder
disp('this is the folder path')
disp(file_to_analyze) 
disp('gSig:')
disp(gSig)
disp('gSiz:')
disp(gSiz)
disp('Spatial downsampling factor:')
disp(ssub)


% add file to path and CNMFE repositories

addpath(file_to_analyze) ;
addpath(genpath('/projects/p30771/MATLAB/CNMF_E')) ;

% run script with options

cd('/projects/p30771/MATLAB/CNMF_E/quest_analysis/quest_MATLAB_cnmfe');

run_cnmfe_matlab_jjm(file_to_analyze, gSig, gSiz, Fs, ssub, false) ;

disp('finished cnmfe run') 
