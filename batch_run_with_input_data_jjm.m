function [] = batch_run_with_input_data_jjm(folder_path, reg_exp, file_extension)
%input variable is folder path to find files

%find all appropriate hdf files in the folder
disp('this is the folder path')
disp(folder_path) 

%combine paths into cell array

array_test = {dir(fullfile(folder_with_files, '*.h5'))}

for i in range size(array_test):
	new_cell_array = {array_test{1, 1}(1).name, array_test{1, 1}(2).name}

%call batch_run.m to start batch CNMF_E


batch_run(new_cell_array)



end

