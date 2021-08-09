function output_image = laplace_operator(image, sigma, threshold)
    % Laplacce operator for edge detection
    % output_image = laplace_operator(image, sigma, threshold)
    size_log = 2*ceil(3*sigma) + 1;     %LOG filter size
    LoG = fspecial('log',size_log,sigma);

    filtered_im = conv2(image,LoG,'same');
    output_image = zeros(size(filtered_im));
    % horizontal scan
    for i = 1 : size(filtered_im,1)
        for j = 2 : size(filtered_im,2)
            if filtered_im(i,j)*filtered_im(i,j-1) < 0  ...
                     && abs(filtered_im(i,j)-filtered_im(i,j-1)) >= threshold
                    % edge detection with additional threshold on the
                    % difference between pixels
                if filtered_im(i,j-1) < 0
                    output_image(i,j-1) = 1;
                else 
                    output_image(i,j) = 1;
                end
            end
        end
    end
    % vertical scan
    for j = 1 : size(filtered_im,2)
        for i = 2 : size(filtered_im,1)
            if filtered_im(i,j)*filtered_im(i-1,j) < 0 ...
                     && abs(filtered_im(i,j)-filtered_im(i-1,j)) >= threshold     % edge detection 
                if filtered_im(i-1,j) < 0
                    output_image(i-1,j) = 1;
                else 
                    output_image(i,j) = 1;
                end
            end
        end
    end
end

