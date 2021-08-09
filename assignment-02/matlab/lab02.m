% Lab 02 - Gloria Dal Santo 14/10/20

close all; clear variables; clc
addpath ./data
addpath ./functions

% read and show
im_name01 = 'lena-y.png';       % intensity          
im_name02 = 'wool.png';         % intensity
im01 = imread(im_name01);
im02 = imread(im_name02);

figure('name','original'); 
subplot(1,2,1); imshow(im01); 
title('lena.png','interpreter','latex','FontSize',16)
subplot(1,2,2); imshow(im02);
title('wool.png','interpreter','latex','FontSize',16)
sgtitle('\textbf{Original images}','interpreter','latex','FontSize',16)

MSE = zeros(9,2);      % mean square values - storing vector
count = 1;

%% Exercise 1 - Fixed Threshold Method
% tic     % start time counter 
thres = 127;                    % threshold level
im01_fix = im01 > thres;
im02_fix = im02 > thres;
% toc     % stop time counter
% plot
figure('name','fixed threshold'); 
subplot(1,2,1); imshow(im01_fix, []); 
title('lena.png','interpreter','latex','FontSize',16)
subplot(1,2,2); imshow(im02_fix, []); 
title('wool.png', 'interpreter', 'latex', 'FontSize', 16);
sgtitle('\textbf{Fixed threshold $T=128$}','interpreter','latex','FontSize',16)

% mean square error
MSE(count,1) = ms_err(im01,im01_fix);
MSE(count,2) = ms_err(im02,im02_fix);
count = count + 1;      % update counter
%% Exercise 2 - Random Threshold Method
% discrete uniform noise
noise_lev = 32;     % noise range [1, 32]
noise01 = unidrnd(noise_lev,size(im01)) - noise_lev/2;  
noise02 = unidrnd(noise_lev,size(im02)) - noise_lev/2;

thres = 127;                    % threshold level
im01_rnd = (double(im01)+noise01) > thres;
im02_rnd = (double(im02)+noise02) > thres;

% plot
figure('name','random fixed threshold'); 
subplot(1,2,1); imshow(im01_rnd, []); 
title('lena.png','interpreter','latex','FontSize',16)
subplot(1,2,2); imshow(im02_rnd, []); 
title('wool.png', 'interpreter', 'latex', 'FontSize', 16);
sgtitle('\textbf{Random Threshold Method}','interpreter','latex','FontSize',16)

% mean square error
MSE(count,1) = ms_err(im01,im01_rnd);
MSE(count,2) = ms_err(im02,im02_rnd);
count = count + 1; 
%% Exercise 3 - Ordered Threshold Method

% clustered dot marix
S = [34 29 17 21 30 35; 28 14 9 16 20 31; 13 8 4 5 15 19; 12 3 0 1 10 18; 27 7 2 6 23 24; 33 26 11 22 25 32];   
N = 37;     % number of threshold levels

% ordered threshold 
im01_ord = ordthres(im01,S);
im02_ord = ordthres(im02,S); 

% plot
figure('name','ordered threshold'); 
subplot(1,2,1); imshow(im01_ord, []); 
title('lena.png','interpreter','latex','FontSize',16)
subplot(1,2,2); imshow(im02_ord, []); 
title('wool.png', 'interpreter', 'latex', 'FontSize', 16);
sgtitle('\textbf{Ordered Threshold Method}','interpreter','latex','FontSize',16)

% mean square error
MSE(count,1) = ms_err(im01,im01_ord);
MSE(count,2) = ms_err(im02,im02_ord);
count = count + 1; 

%% Exercise 4 - Ordered Threshold Method with centered points

% centered points matrix
C6 = [34 25 21 17 29 33; 30 13 9 5 12 24; 18 6 1 0 8 20; 22 10 2 3 4 16; 26 14 7 11 15 28; 35 31 19 23 27 32];
E6 = [30 22 16 21 33 35; 24 11 7 9 26 28; 13 5 0 2 14 19; 15 3 1 4 12 18; 27 8 6 10 25 29; 32 20 17 23 31 34];

% dithering
im01_ord_C6 = ordthres(im01,C6);
im02_ord_C6 = ordthres(im02,C6);

im01_ord_E6 = ordthres(im01,E6);
im02_ord_E6 = ordthres(im02,E6);

% plot
figure('name','ordered threshold C6'); 
subplot(1,2,1); imshow(im01_ord_C6, []); 
title('lena.png','interpreter','latex','FontSize',16)
subplot(1,2,2); imshow(im02_ord_C6, []); 
title('wool.png','interpreter','latex','FontSize',16)
sgtitle('\textbf{Ordered Threshold Method with centered points} - $C_6$','interpreter','latex','FontSize',16)

figure('name','ordered threshold E6'); 
subplot(1,2,1); imshow(im01_ord_E6, []); 
title('lena.png','interpreter','latex','FontSize',16)
subplot(1,2,2); imshow(im02_ord_E6, []); 
title('wool.png', 'interpreter', 'latex', 'FontSize', 16);
sgtitle('\textbf{Ordered Threshold Method with centered points} - $E_6$','interpreter','latex','FontSize',16)

% mean square error
MSE(count,1) = ms_err(im01,im01_ord_C6);
MSE(count,2) = ms_err(im02,im02_ord_C6);
count = count + 1; 

MSE(count,1) = ms_err(im01,im01_ord_E6);
MSE(count,2) = ms_err(im02,im02_ord_E6);
count = count + 1;

%% Exercise 5 - Diagonal ordered matrix with balanced centered points

% diagonal ordered matrix with balanced centered point
O8_1 = [13 9 5 12; 6 1 0 8; 10 2 3 4; 14 7 11 15];
O8_2 = [18 22 26 19; 25 30 31 23; 21 29 28 27; 17 24 20 16];
O8 = [O8_1 O8_2; O8_2 O8_1];

% dithering
im01_ord_O8 = ordthres(im01,O8);
im02_ord_O8 = ordthres(im02,O8);

% plot
figure('name','ordered threshold O8'); 
subplot(1,2,1); imshow(im01_ord_O8, []); 
title('lena.png','interpreter','latex','FontSize',16)
subplot(1,2,2); imshow(im02_ord_O8, []); 
title('wool.png', 'interpreter', 'latex', 'FontSize', 16);
sgtitle('\textbf{Ordered Threshold Method with balanced centered points}','interpreter','latex','FontSize',16)

% mean square error
MSE(count,1) = ms_err(im01,im01_ord_O8);
MSE(count,2) = ms_err(im02,im02_ord_O8);
count = count + 1; 

%% Exercise 6 - Ordered matrix with dispersed dots

% Bayer recursive algo
n = 3;  
D3 = [8 4 5; 3 0 1; 7 2 6];
D6 = [4*D3 (4*D3 + 2*ones(n,n)); (4*D3 + 3*ones(n,n)) (4*D3 + ones(n,n))];

% dithering
im01_ord_D6 = ordthres(im01,D6);
im02_ord_D6 = ordthres(im02,D6);

% plot
figure('name','ordered threshold D6'); 
subplot(1,2,1); imshow(im01_ord_D6, []); 
title('lena.png','interpreter','latex','FontSize',16)
subplot(1,2,2); imshow(im02_ord_D6, []); 
title('wool.png', 'interpreter', 'latex', 'FontSize', 16);
sgtitle('\textbf{Ordered Threshold Method with dispersed dots}','interpreter','latex','FontSize',16)

% mean square error
MSE(count,1) = ms_err(im01,im01_ord_D6);
MSE(count,2) = ms_err(im02,im02_ord_D6);
count = count + 1; 

%% Exercise 7 - Error diffusion method

% Floyd & Steinberg
thresh = 127;
im01_dith_fs = error_diff(im01, 0, thresh);
im02_dith_fs = error_diff(im02, 0, thresh);
% plot
figure('name','Error diffusion - Floyd & Steinberg'); 
subplot(1,2,1); imshow(im01_dith_fs, []); 
title('lena.png','interpreter','latex','FontSize',16)
subplot(1,2,2); imshow(im02_dith_fs, []); 
title('wool.png', 'interpreter', 'latex', 'FontSize', 16);
sgtitle('\textbf{Error Diffusion - Floyd \& Steinberg}','interpreter','latex','FontSize',16)

% Stucki
im01_dith_s = error_diff(im01, 1, thresh);
im02_dith_s = error_diff(im02, 1, thresh);
% plot
figure('name','Error diffusion - Stucki'); 
subplot(1,2,1); imshow(im01_dith_s, []); 
title('lena.png','interpreter','latex','FontSize',16)
subplot(1,2,2); imshow(im02_dith_s, []); 
title('wool.png', 'interpreter', 'latex', 'FontSize', 16);
sgtitle('\textbf{Error Diffusion - Stucki}','interpreter','latex','FontSize',16)

% mean square error
MSE(count,1) = ms_err(im01,im01_dith_fs);
MSE(count,2) = ms_err(im02,im02_dith_fs);
count = count + 1;

MSE(count,1) = ms_err(im01,im01_dith_s);
MSE(count,2) = ms_err(im02,im02_dith_s);












