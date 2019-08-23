function [ output_args ] = fn_directory_to_multitiff(dirpath, movie_start, movie_end, parallel)
%AVI from miniscope to mutliframe tiff
%   Input: full path to move file

%loop through videos  
if parallel == true
    
    parfor x = movie_start:movie_end
        fn_avi_to_multitiff(strcat(dirpath, 'msCam', num2str(x), '.avi'));
    end
    
else

    for x = (movie_start): movie_end
        fn_avi_to_multitiff(strcat(dirpath, 'msCam', num2str(x), '.avi'));

    end    
end

