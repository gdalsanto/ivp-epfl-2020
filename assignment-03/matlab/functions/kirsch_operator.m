function output_image = kirsch_operator(image, threshold)
    % Kirch compass operator for edge detection
    % output_image = kirsch_operator(image, threshold)
    kirsch_1 = [-3 -3 5; -3 0 5; -3 -3 5];
    kirsch_2 = [-3 5 5; -3 0 5; -3 -3 -3];
    
    kirsch_mat = zeros(3,3,8);
    for i = 1 : 2 : 7
        kirsch_mat(:,:,i) = kirsch_1;
        kirsch_1 = rot90(kirsch_1);
    end
    for i = 2 : 2 : 8
        kirsch_mat(:,:,i) = kirsch_2;
        kirsch_2 = rot90(kirsch_2);
    end
    kirsch_vect = zeros(3*3,8);
    for i = 1 : 8
        temp = kirsch_mat(:,:,i)';
        kirsch_vect(:,i) = temp(:);
    end

    output_image = zeros(size(image));
    for n = 2 : size(image,1) - 1
        for m = 2 : size(image,2) - 1
            imag_vect = image(n-1:n+1,m-1:m+1)';    % 3x3 submatrix
            imag_vect = imag_vect(:);               % vector form
            output_image(n,m) = max(kirsch_vect'*double(imag_vect));
        end
    end
    output_image = output_image > threshold;
end

