% path to tiff or hdf5 file

files_to_analyze = {'/projects/p30771/miniscope/data/GRIN027/H13_M29_S44/memmap_0000memmap_0004_resized.h5';
                    '/projects/p30771/miniscope/data/GRIN027/H13_M29_S44/memmap_0005memmap_0009_resized.h5';
                    '/projects/p30771/miniscope/data/GRIN027/H13_M29_S44/memmap_0010memmap_0014_resized.h5';
                    '/projects/p30771/miniscope/data/GRIN027/H13_M29_S44/memmap_0015memmap_0019_resized.h5';
                    '/projects/p30771/miniscope/data/GRIN027/H13_M29_S44/memmap_0020memmap_0024_resized.h5';   
                    '/projects/p30771/miniscope/data/GRIN027/H13_M29_S44/memmap_0025memmap_0029_resized.h5' 
                    };

% add file to path and CNMFE repositories

addpath(file_to_analyze) ;
addpath(genpath('/projects/p30771/MATLAB/CNMF_E')) ;

% run script with options

cd('/projects/p30771/MATLAB/CNMF_E/quest_analysis/quest_MATLAB_cnmfe');

run_cnmfe_batch_matlab_jjm(files_to_analyze, 13, 40, 20, false) ;

disp('finished cnmfe run') 
