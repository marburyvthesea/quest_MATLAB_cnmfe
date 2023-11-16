




% add file to path and CNMFE repositories

addpath(dirpath) ;
addpath(genpath('/projects/p30771/MATLAB/CNMF_E_jjm/')) ;

% run script with options

cd('/projects/p30771/MATLAB/CNMF_E_jjm/quest_MATLAB_cnmfe/');
disp('v4:');
disp(v4); 


if v4=='true'
	disp('v4 file')
	fn_directory_to_multitiff_v4(dirpath, movie_start, movie_end, parallel)
else
	disp('not v4 file')
	fn_directory_to_multitiff(dirpath, movie_start, movie_end, parallel);
end 
