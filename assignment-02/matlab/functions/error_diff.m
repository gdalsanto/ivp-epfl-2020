function dithered_image = error_diff(image, type, thresh)
% ERROR DIFFUSION METHOD for dithering
% dithered_image = error_diff(image, type)
% type = 0 -> Folyd & Steinberg diffusion matrix
% type = 1 -> Stucki diffusion matrix
% thresh: fix threshold value
    
    
    if type == 0
    % Floyd & Steinberg
        image_pad = padarray(double(image),[1,1],'both'); % pad with zeros at boundaries
        image_pad = image_pad/255;                      % scaled image [0 255] -> [0 1]
        dithered_image = zeros(size(image));            % output dithered image
        dithered_image = logical(dithered_image);
        for i = 2 : size(image,1)+1
            for j = 2 : size(image,2)+1
                temp = image_pad(i,j);                   % current pixel
                dithered_image(i-1,j-1) = temp*255 > thresh;
                err = (temp - dithered_image(i-1,j-1))/16;
                % diffusion
                image_pad(i:i+1,j-1:j+1) = image_pad(i:i+1,j-1:j+1) + [0 0 7; 3 5 1]*err;
            end
        end
    elseif type == 1
   % Stucki
        image_pad = padarray(double(image),[2,2],'both'); % pad with zeros at boundaries
        image_pad = image_pad/255;                      % scaled image [0 255] -> [0 1]
        dithered_image = zeros(size(image));            % output dithered image
        dithered_image = logical(dithered_image);        
        for i = 3 : size(image,1)+1
            for j = 3 : size(image,2)+1
                temp = image_pad(i,j);                   % current pixel
                dithered_image(i-1,j-1) = temp*255 > thresh;
                err = (temp - dithered_image(i-1,j-1))/42;
                % diffusion
                image_pad(i:i+2,j-2:j+2) = image_pad(i:i+2,j-2:j+2) + [0 0 0 8 4; 2 4 8 4 2; 1 2 4 2 1]*err;            
            end
        end
    else
        error('Incorrect value in field ''type''')
    end
end