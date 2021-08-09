function output_image = template_method(image,template_type, threshold ,norm_type)
    % contour detection with template method 
    % output_image = template_method(filter_x, filter_y, norm_type)
    % template_type =   1 for Sobel
    %                   2 for Prewitt
    %                   3 for Roberts
    % norm_type =   2 for l2 norm
    %               1 for l1 norm
    
    if template_type == 1
        % Sobel
        g1 = [1 0 -1; 2 0 -2; 1 0 -1]/4;
        g2 = [-1 -2 -1; 0 0 0; 1 2 1]/4;
    elseif template_type == 2
        % Prewitt 
        g1 = [1 0 -1; 1 0 -1; 1 0 -1]/3;
        g2 = [-1 -1 -1; 0 0 0; 1 1 1]/3;
    elseif template_type == 3
        % Roberts 
        g1 = [0 0 -1; 0 1 0; 0 0 0];
        g2 = [-1 0 0 ; 0 1 0; 0 0 0];
    else 
        error('Wrong value in template_type. Expected values: [1, 2, 3]');
    end
    im_filtered_1 = conv2(image,g1,'same');
    im_filtered_2 = conv2(image,g2,'same');
    % norm selection
    if norm_type == 2
        norm = sqrt(im_filtered_1.^2 + im_filtered_2.^2); 
    elseif norm_type == 1
        norm = abs(im_filtered_1) + abs(im_filtered_2);
    else
        error('incorrect value for ''norm_type''');
    end
    output_image = abs(norm) > threshold;
end

