% path to tiff or hdf5 file

files_to_analyze = {'/projects/p30771/miniscope/data/GRIN011/1_24_2019/H10_M19_S59/TIFs/mmapfiles_C_order/mmap_C_order/memmap_0000memmap_0004_resized.h5',
                    '/projects/p30771/miniscope/data/GRIN011/1_24_2019/H10_M19_S59/TIFs/mmapfiles_C_order/mmap_C_order/memmap_0005memmap_0010_resized.h5',
                    '/projects/p30771/miniscope/data/GRIN011/1_24_2019/H10_M19_S59/TIFs/mmapfiles_C_order/mmap_C_order/memmap_0011memmap_0015_resized.h5',
                    '/projects/p30771/miniscope/data/GRIN011/1_24_2019/H10_M19_S59/TIFs/mmapfiles_C_order/mmap_C_order/memmap_0016memmap_0018_resized.h5',
                    };

% add file to path and CNMFE repositories

addpath(file_to_analyze) ;
addpath(genpath('/projects/p30771/MATLAB/CNMF_E')) ;

% run script with options

cd('/projects/p30771/MATLAB/CNMF_E/quest_analysis/quest_MATLAB_cnmfe');

run_cnmfe_batch_matlab_jjm(files_to_analyze, 13, 40, 20, false) ;

disp('finished cnmfe run') 
