function [ output_args ] = fn_directory_to_multitiff(dirpath, movie_start, movie_end, parallel)
%AVI from miniscope to mutliframe tiff
%   Input: full path to move file

disp('movie start');
disp(movie_start);
disp('movie end'); 
disp(movie_end); 

%loop through videos  
if parallel == true
   
    disp('processing in parallel');

    parfor x = movie_start:movie_end
	disp(x);	
        fn_avi_to_multitiff(strcat(dirpath, 'msCam', num2str(x), '.avi'));
    end
    
else

    disp('parellel off');

    for x = movie_start:movie_end
	disp(x);
        fn_avi_to_multitiff(strcat(dirpath, 'msCam', num2str(x), '.avi'));

    end    
end

