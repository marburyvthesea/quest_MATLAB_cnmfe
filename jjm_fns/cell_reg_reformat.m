

% load matlab output files from cnmfe
% have cell array of matlab output files


s_f = size(files_array)

for i = 1:s_f(1,1)
    load(files_array{2,1});
    
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
        
    % save reformatted neurons for cell reganalysis
        
        