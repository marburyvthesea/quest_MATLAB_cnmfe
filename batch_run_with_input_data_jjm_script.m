%batch_run_with_input_data_jjm_script
%input variable is folder path to find files

%find all appropriate hdf files in the folder
disp('this is the folder path')
disp(folder_path) 

%combine paths into cell array

files = {dir(fullfile(folder_path, '*.h5'))} ;
size_ = [size(files)] ; 
len = size_(1) ; 

files_array = {} ;
for i = 1:len ;
  files_array{i,1} = files{i, 1}.name ; 
end

nams = files_array ; 
disp('found files')
disp(nams)

call batch_run.m to start batch CNMF_E
run_cnmfe_batch_matlab_jjm(nams, 13, 40, 20, false)



end

