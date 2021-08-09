% Lab 03 - Gloria Dal Santo 28/10/20
clear variables; close all; clc
addpath ./functions
addpath ./data

% read and show
im_name01 = 'lena.png';         % intensity          
im_name02 = 'rice.png';         
im_name03 = 'road.png';         

im01 = imread(im_name01);
im02 = imread(im_name02);
im03 = imread(im_name03);

% noisy images
sigma = [5, 11, 25]/255;        % standard deviation
im02_noise = zeros(size(im02,1), size(im02,2), 3);
im02_noise_n = zeros(size(im02,1), size(im02,2), 3); % used to save processed images
im02_noise(:,:,1) = imnoise(rescale(im02),'gaussian',0,sigma(1)^2);
im02_noise(:,:,2) = imnoise(rescale(im02),'gaussian',0,sigma(2)^2);
im02_noise(:,:,3) = imnoise(rescale(im02),'gaussian',0,sigma(3)^2);

% plot original images
figure('name','originals')
subplot(1,3,1); imshow(im01,[]);
title('\textbf{lena.png} - original','interpreter','latex','FontSize',16);
subplot(1,3,2); imshow(im02,[]);
title('\textbf{rice.png} - original','interpreter','latex','FontSize',16);
subplot(1,3,3); imshow(im03,[]);
title('\textbf{road.png} - original','interpreter','latex','FontSize',16);

% plot disturbed images
figure('name','noisy images')
subplot(1,3,1); imshow(im02_noise(:,:,1),[]);
title('$\sigma = 5$','interpreter','latex','FontSize',16);
subplot(1,3,2); imshow(im02_noise(:,:,2),[]);
title('$\sigma = 11$','interpreter','latex','FontSize',16);
subplot(1,3,3); imshow(im02_noise(:,:,3),[]);
title('$\sigma = 25$','interpreter','latex','FontSize',16);
sgtitle('Gaussian noise','interpreter','latex','FontSize',16)

%% Exercise 1 - Template method

templ_method = 1;       % 1-Sobel, 2-Prewitt, 3_Roberts

thresh = 30;     % threshold values
im01_edge = template_method(im01,templ_method,thresh,1);
im02_edge = template_method(im02,templ_method,thresh,1);
im03_edge = template_method(im03,templ_method,thresh,1);

figure('name','template method')
subplot(1,3,1); imshow(im01_edge,[]);
subplot(1,3,2); imshow(im02_edge,[]);
subplot(1,3,3); imshow(im03_edge,[]);
sgtitle('Template method','interpreter','latex','FontSize',16)
%%
% Gaussian distortion
thresh = 40/255;        % threshold values
im02_noise_n(:,:,1) = template_method(im02_noise(:,:,1),templ_method,thresh,1);
im02_noise_n(:,:,2) = template_method(im02_noise(:,:,2),templ_method,thresh,1);
im02_noise_n(:,:,3) = template_method(im02_noise(:,:,3),templ_method,thresh,1);

figure('name','template method - noisy images')
subplot(1,3,1); imshow(im02_noise_n(:,:,1),[]); title('$\sigma = 5$','interpreter','latex','FontSize',16);
subplot(1,3,2); imshow(im02_noise_n(:,:,2),[]); title('$\sigma = 11$','interpreter','latex','FontSize',16);
subplot(1,3,3); imshow(im02_noise_n(:,:,3),[]); title('$\sigma = 25$','interpreter','latex','FontSize',16);
sgtitle('Template method with noise','interpreter','latex','FontSize',16)

%% Exercise 2 - Compass operator

thresh = 300;     % threshold values

im01_kirsch = kirsch_operator(im01, thresh);
im02_kirsch = kirsch_operator(im02, thresh);
im03_kirsch = kirsch_operator(im03, thresh);

figure('name','Kirsch operator')
subplot(1,3,1); imshow(im01_kirsch,[]);
subplot(1,3,2); imshow(im02_kirsch,[]);
subplot(1,3,3); imshow(im03_kirsch,[]);
sgtitle('Kirsch operator','interpreter','latex','FontSize',16)


% Gaussian distortion
thresh = 400/255;
im02_noise_n(:,:,1) = kirsch_operator(im02_noise(:,:,1), thresh);
im02_noise_n(:,:,2) = kirsch_operator(im02_noise(:,:,2), thresh);
im02_noise_n(:,:,3) = kirsch_operator(im02_noise(:,:,3), thresh);

figure('name','Kirsch operator - noisy images')
subplot(1,3,1); imshow(im02_noise_n(:,:,1),[]); title('$\sigma = 5$','interpreter','latex','FontSize',16);
subplot(1,3,2); imshow(im02_noise_n(:,:,2),[]); title('$\sigma = 11$','interpreter','latex','FontSize',16);
subplot(1,3,3); imshow(im02_noise_n(:,:,3),[]); title('$\sigma = 25$','interpreter','latex','FontSize',16);
sgtitle('Kirsch operator with noise','interpreter','latex','FontSize',16)


%% Exercise 3 - Laplace operator

sigma = 3; 
thresh = 0.1;   % threshold on the difference between pixels
im01_laplace = laplace_operator(im01, sigma, thresh);
im02_laplace = laplace_operator(im02, sigma, thresh);
im03_laplace = laplace_operator(im03, sigma, thresh);

figure('name','Laplace operator')
subplot(1,3,1); imshow(im01_laplace,[]);
subplot(1,3,2); imshow(im02_laplace,[]);
subplot(1,3,3); imshow(im03_laplace,[]);
sgtitle('Laplace operator','interpreter','latex','FontSize',16)

% Gaussian distortion
thresh = 0.001;   % threshold on the difference between pixels
im02_noise_n(:,:,1) = laplace_operator(im02_noise(:,:,1),sigma, thresh);
im02_noise_n(:,:,2) = laplace_operator(im02_noise(:,:,2),sigma, thresh);
im02_noise_n(:,:,3) = laplace_operator(im02_noise(:,:,3),sigma, thresh);

figure('name','Laplace operator - noisy images')
subplot(1,3,1); imshow(im02_noise_n(:,:,1),[]); title('$\sigma = 5$','interpreter','latex','FontSize',16);
subplot(1,3,2); imshow(im02_noise_n(:,:,2),[]); title('$\sigma = 11$','interpreter','latex','FontSize',16);
subplot(1,3,3); imshow(im02_noise_n(:,:,3),[]); title('$\sigma = 25$','interpreter','latex','FontSize',16);
sgtitle('Laplace operator with noise','interpreter','latex','FontSize',16)
    
 %% Exercise 4 - Frei-Chen method

thresh = 0.9;
im01_FC = FreiChen_method(im01, thresh);
im02_FC = FreiChen_method(im02, thresh);
im03_FC = FreiChen_method(im03, thresh);

figure('name','Frei-Chen method')
subplot(1,3,1); imshow(im01_FC,[]);
subplot(1,3,2); imshow(im02_FC,[]);
subplot(1,3,3); imshow(im03_FC,[]);
sgtitle('Frei-Chen method','interpreter','latex','FontSize',16)

thresh = 0.87;
% Gaussian distortion
im02_noise_n(:,:,1) = FreiChen_method(im02_noise(:,:,1),thresh);
im02_noise_n(:,:,2) = FreiChen_method(im02_noise(:,:,2),thresh);
im02_noise_n(:,:,3) = FreiChen_method(im02_noise(:,:,3),thresh);

figure('name','Frei-Chen - noisy images')
subplot(1,3,1); imshow(im02_noise_n(:,:,1),[]); title('$\sigma = 5$','interpreter','latex','FontSize',16);
subplot(1,3,2); imshow(im02_noise_n(:,:,2),[]); title('$\sigma = 11$','interpreter','latex','FontSize',16);
subplot(1,3,3); imshow(im02_noise_n(:,:,3),[]); title('$\sigma = 25$','interpreter','latex','FontSize',16);
sgtitle('Frei-Chen method with noise','interpreter','latex','FontSize',16)









