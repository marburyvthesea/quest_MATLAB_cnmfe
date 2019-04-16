

% load matlab output files from cnmfe
% have cell array of matlab output files


files_array = {'/Users/johnmarshall/Documents/MATLAB/miniscopemovieforanalysis/cellregtest/memmap_0000memmap_0000_resized_source_extraction/frames_1_101/LOGS_15-Apr_18_05_16/15-Apr_18_11_57.mat' ;
    '/Users/johnmarshall/Documents/MATLAB/miniscopemovieforanalysis/cellregtest/memmap_0001memmap_0001_resized_source_extraction/frames_1_101/LOGS_15-Apr_18_06_56/15-Apr_18_11_35.mat' }		
output_folder = '/Users/johnmarshall/Documents/MATLAB/CellReg/JJM_Data/GRIN011_substack_tests/'

s_f = size(files_array)

for i = 1:s_f(1,1)
    load(files_array{i,1});
    
    % reshape spatial footprints of neurons
    A_reshaped = neuron.reshape(neuron.A, 2);
    A_size = size(A_reshaped);
    num_neurons = A_size(1, 3);
    siz_y = A_size(1, 1);
    siz_x = A_size(1, 2);
    
    rescaled = zeros(num_neurons, siz_y, siz_x); 
    
    for j = 1:num_neurons
        %scale to sum
        j_reshaped = A_reshaped(:,:,j);
        j_sum = sum(sum(j_reshaped));
        j_scaled = j_reshaped./j_sum ;
        %concactenate 
        rescaled(j, :, :) = j_scaled;
    end
    save(strcat(output_folder, 'session', num2str(i)), 'rescaled');
    % save reformatted neurons for cell reganalysis
end 