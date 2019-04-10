

% load matlab output files from cnmfe
% have cell array of matlab output files


files_array = {'/Volumes/My_Passport/MiniscopeMovies/3_9_2019/H13_M33_S54/questanalysisrun/memmap_0000memmap_0004_resized_source_extraction/frames_1_5000/LOGS_06-Apr_14_09_13/06-Apr_15_02_43.mat' ; 
    '/Volumes/My_Passport/MiniscopeMovies/3_9_2019/H13_M33_S54/questanalysisrun/memmap_0005memmap_0009_resized_source_extraction/frames_1_5000/LOGS_06-Apr_14_10_08/06-Apr_14_39_54.mat' ;
    '/Volumes/My_Passport/MiniscopeMovies/3_9_2019/H13_M33_S54/questanalysisrun/memmap_0010memmap_0014_resized_source_extraction/frames_1_5000/LOGS_06-Apr_14_09_36/06-Apr_14_35_09.mat' ;
    '/Volumes/My_Passport/MiniscopeMovies/3_9_2019/H13_M33_S54/questanalysisrun/memmap_0015memmap_0019_resized_source_extraction/frames_1_5000/LOGS_06-Apr_14_11_09/06-Apr_14_49_48.mat' ;
    '/Volumes/My_Passport/MiniscopeMovies/3_9_2019/H13_M33_S54/questanalysisrun/memmap_0020memmap_0024_resized_source_extraction/frames_1_5000/LOGS_06-Apr_14_10_04/06-Apr_14_40_37.mat' }		
output_folder = '/Users/johnmarshall/Documents/MATLAB/CellReg/JJM_Data/3_9_2019_H13_M33_S54/'

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