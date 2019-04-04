%batch_run_with_input_data_jjm_script
%input variable is folder path to find files

% get cnmfe params, change to numberic values
batch_frames_num = str2num(batch_frames_num) ; 
gSig = str2num(gSig) ; 
gSiz = str2num(gSiz) ; 
Fs = str2num(Fs) ;
ssub = str2num(ssub) ;  


%find all appropriate hdf files in the folder
disp('this is the folder path')
disp(folder_path) 
disp('number of frames in each batch:')
disp(batch_frames_num)
disp('gSig:')
disp(gSig)
disp('gSiz:')
disp(gSiz)
disp('Spatial downsampling factor:')
disp(ssub)


%combine paths into cell array

files = {dir(fullfile(folder_path, '*.h5'))} ;
size_ = [size(files{1,1})] ; 
num_files = size_(1) ; 
file_names = {files{1,1}.name} ;

disp(num_files)

files_array = {} ;
for i = 1:num_files 
	disp(i)
	files_array{i,1} = strcat(folder_path, '/', file_names{1,i}) ; 
end

nams = files_array ; 
disp('found files')
disp(nams)
addpath(folder_path)

% add cnmfe folder to path
addpath(genpath('/projects/p30771/MATLAB/CNMF_E/')) ;
% run cnmfe_setup
cnmfe_setup

disp('running cnmfe')


%call batch_run.m to start batch CNMF_E
%run_cnmfe_batch_matlab_jjm(nams, 13, 40, 20, false)


demo_batch_1p_jjm_2



