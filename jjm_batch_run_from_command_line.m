% path to tiff or hdf5 file

%files_to_analyze = {'/projects/p30771/miniscope/data/GRIN018/H17_M41_S43/memmap_0000memmap_0004_resized.h5';
%                    '/projects/p30771/miniscope/data/GRIN018/H17_M41_S43/memmap_0005memmap_0009_resized.h5';
%                    '/projects/p30771/miniscope/data/GRIN018/H17_M41_S43/memmap_0010memmap_0014_resized.h5';
%                    '/projects/p30771/miniscope/data/GRIN018/H17_M41_S43/memmap_0015memmap_0019_resized.h5';
%                    '/projects/p30771/miniscope/data/GRIN018/H17_M41_S43/memmap_0020memmap_0021_resized.h5'
%                    };

% get cnmfe params, change to numberic values
% path to tiff or hdf5 file
%file_to_analyze 
disp(files_to_analyze); 

gSig = str2num(gSig) ; 
gSiz = str2num(gSiz) ; 
Fs = str2num(Fs) ;
ssub = str2num(ssub) ;  
%min_corr = str2num(min_corr);
%min_pnr = str2num(min_pnr); 
frame_size = str2num(frame_size) ;

%find all appropriate hdf files in the folder
disp('gSig:')
disp(gSig)
disp('gSiz:')
disp(gSiz)
disp('Fs')
disp(Fs)
disp('Spatial downsampling factor:')
disp(ssub)
disp('min_corr: minimum local correlation for seeding:')
disp(min_corr)
disp('min_pnr: minimum peak to noise ration for seeding:')
disp(min_pnr)
disp('deconvolution method:')
disp(deconvolution_type)
disp('Parallel processing enabled')
disp(parallel_enable)
disp('Number of frames per batch')
disp(frame_size)

% add file to path and CNMFE repositories

%addpath(file_to_analyze) ;
%addpath(genpath('/projects/p30771/MATLAB/CNMF_E_jjm')) ;

% run script with options

%cd('/projects/p30771/MATLAB/CNMF_E_jjm/quest_MATLAB_cnmfe');

neuron = run_cnmfe_batch_matlab_jjm(files_to_analyze, gSig, gSiz, Fs, ssub, min_corr, min_pnr, deconvolution_type, parallel_enable, frame_size, false) ;

neuron.save_workspace()

neuron.save_workspace_batch();

disp('finished cnmfe run') 

disp('file paths for data:')
disp(neuron.P.file_paths)

disp('full path')

full_file_path = neuron
disp(full_file_path)

exit;
