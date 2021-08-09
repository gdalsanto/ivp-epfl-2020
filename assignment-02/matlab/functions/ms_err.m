function error = ms_err(image1, image2)
    % MEAN SQUARE ERROR 
    % error = ms_err(image1, image2)
    % computes the error between image1 and image2
    % dimensions must be equal
   
    if size(image1) ~= size(image2)
        disp('input matrix dimensions must be the same');
        return
    end
    
    M = size(image1,1);
    N = size(image2,2);
    diff = double(image1) - double(image2);
    diff = diff';
    diff = diff(:);
    error = diff'*diff/M/N;
    
end