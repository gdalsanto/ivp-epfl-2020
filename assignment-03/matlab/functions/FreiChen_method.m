function output_image = FreiChen_method(image, threshold)
    % Frei-Chen method for edge detection
    % output_image = FreiChen_method(image, threshold)
    f = zeros(3,3,9);           % Frei-Chen masks
    f(:,:,1) = [1 sqrt(2) 1; 0 0 0; -1 -sqrt(2) -1]/2/sqrt(2);
    f(:,:,2) = rot90(f(:,:,1));
    f(:,:,3) = [0 -1 sqrt(2); 1 0 -1; -sqrt(2) 1 0]/2/sqrt(2);
    f(:,:,4) = rot90(f(:,:,3));
    f(:,:,5) = [0 1 0; -1 0 -1; 0 1 0]/2;
    f(:,:,6) = [-1 0 1; 0 0 0; 1 0 -1]/2;
    f(:,:,7) = [1 -2 1; -2 4 -2; 1 -2 1]/6;
    f(:,:,8) = [-2 1 -2; 1 4 1; -2 1 -2]/6;
    f(:,:,9) = ones(3,3)/3;


    y = zeros(size(image,1),size(image,2),9);
    for i = 1 : 8
        y(:,:,i) = conv2(image, f(:,:,i),'same');
    end
    m = sum(y(:,:,1:2).^2,3);
    s = sum(y(:,:,1:9).^2,3);
    alpha = sqrt(m./s);
    
    % thresholding
    output_image = alpha > threshold;
end