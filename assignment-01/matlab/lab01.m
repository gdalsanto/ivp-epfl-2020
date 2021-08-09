% Lab 01 - Gloria Dal Santo 23/09/20
%% Exercise 3.1 - Images and color tables
close all
clear variables
clc
addpath ./functions 
addpath ./data/images

% 1 - read and show
im_name01 = 'trees.tif';            % indexed 
im_name02 = 'lena.tif';             % RGB

[im01,map01] = imread(im_name01);   % read the 'trees.tif' image
figure('name',[im_name01 ' - indexed']);            
imshow(im01,map01);                 % show the indexed image
title('\textbf{trees.tif} - indexed','interpreter','latex','FontSize',16)
figure('name',[im_name01 ' - TrueColor']);  
image(ind2rgb(im01,map01));         % show the TrueColor version
title('\textbf{trees.tif} - TrueColor','interpreter','latex','FontSize',16)

im02 = imread(im_name02);           % read the 'lena.tif' image
figure('name',[im_name02 ' - TrueColor'])
imshow(im02);                       % show the TrueColor image
title('\textbf{lena.tif} - TrueColor','interpreter','latex','FontSize',16)
figure('name',[im_name02 ' - indexed'])
[im02_indx,map02] = rgb2ind(im02,256);   % convert to the indexed format
imshow(im02_indx,map02)                  % show the indexed version
title('\textbf{lena.tif} - indexed','interpreter','latex','FontSize',16)

% 2 - gray scale
figure('name',[im_name01 ' - gray']);
imshow(im01,rgb2gray(map01));       % show the gray version
title('\textbf{trees.tif} - gray','interpreter','latex','FontSize',16)

figure('name',[im_name02 ' - gray']);
imshow(rgb2gray(im02));             % show the gray version
title('\textbf{lena.tif} - gray','interpreter','latex','FontSize',16)

% 2 - invert
figure('name',[im_name01 ' - inverted'])
imshow(im01,1-map01);               % show the inverted version
title('\textbf{trees.tif} - negative','interpreter','latex','FontSize',16)

figure('name',[im_name02 ' - inverted']);
imshow(1-double(rgb2gray(im02))/255);   % show the inverted version
title('\textbf{lena.tif} - negative','interpreter','latex','FontSize',16)

% 3 - gamma correction
gamma = 0.5;
figure('name',[im_name01 ' - gamma correction'])
% imshow(im01,map01.^gamma);
imshow(im01,cgamma(map01,gamma))    % show im01 with gamma equal to 0.5
title(['\textbf{trees.tif} - $\gamma$ = ' num2str(gamma)],'interpreter','latex','FontSize',16)

figure('name',[im_name02 ' - gamma correction']);
% imshow(imadjust(im02,[],[],gamma));
imshow(cgamma(double(im02)/255,gamma)) % show im02 with gamma equal to 0.5
title(['\textbf{lena.tif} - $\gamma$ = ' num2str(gamma)],'interpreter','latex','FontSize',16)

% 4 -  8x8 chess board
im_name03 = 'chess_board_01.tif';   % truecolor
im_name04 = 'chess_board_02.tif';
x = [1 0 1 0; 0 1 0 1];             % elementary pattern
im03 = zeros(8,8,3);                % truecolor image
im03(:,:,1) = 255*repmat(x,4,2);            % R
im03(:,:,2) = 255*repmat(x,4,2);            % G
im03(:,:,3) = 255*repmat(abs(1-x),4,2);     % B
figure('name',im_name03);
imshow(uint8(im03))
[im04,map04] = rgb2ind(uint8(im03),2);
figure('name',im_name04);
imshow(im04,map04)
imwrite(uint8(im03),['./data/out/' im_name03]);
imwrite(im04,map04,['./data/out/' im_name04]);

%% Exercise 3.2 - Image quantization
% close all
% clear variable
% clc

im_name05 = 'lena-y.png';           
im05 = imread(im_name05);   % intensity

Delta = [1, 2, 4, 8, 16, 32, 64, 128];      % quantization step size
figure('name',im_name05);
for i = 1:8
    % quantization
    im05_quant = floor(im05/Delta(i))*Delta(i) + Delta(i)/2;
    % plot
    subplot(2,4,i)
    imshow(im05_quant);
     if i == 1
        title('original','interpreter','latex','FontSize',16);
    else
        title(['$\Delta\,=\,$' num2str(Delta(i))],'interpreter','latex','FontSize',16);
    end
end
sgtitle('\textbf{Image quantization}','interpreter','latex','FontSize',16)

%% Exercise 3.3 - Filtering
% close all
% clear variable
% clc

% LowPass filter g1
g = [0.0357 0.2411 0.4464 0.2411 0.0357]';
g1 = g*g';                          % calculate the 2D filter
% frequency response 
[G1,f1,f2] = freqz2(g1);    
figure('name','LP filter');
mesh(f1,f2,G1);
title('Filter $G_1$ frequency response','interpreter','latex','FontSize',16);
xlabel('f','interpreter','latex','FontSize',16);
ylabel('g','interpreter','latex','FontSize',16);
zlabel('$|G_1(f,g)|$','interpreter','latex','FontSize',16);

im_name06 = 'gold-text.png';        % intensity            
im06 = imread(im_name06);
figure('name',im_name06)
imshow(im06,[]);
title('\textbf{gold-text.png}','interpreter','latex','FontSize',16)
% convolution
im06_flt = conv2(im06,g1,'same');   % filter the image
figure('name',im_name06);
imshow(im06_flt,[])
title('$y(k,l) = x(k,l)**g_1(k,l)$','interpreter','latex','FontSize',16) 

% HightPass filter 2D g2
g2 = [-1 -4 -1; -4 26 -4; -1 -4 -1]/6;
% frequency response 
[G2,f1,f2] = freqz2(g2);
figure('name','HP filter');
mesh(f1,f2,G2);
title('Filter $G_2$ frequency response','interpreter','latex','FontSize',16);
xlabel('f','interpreter','latex','FontSize',16);
ylabel('g','interpreter','latex','FontSize',16);
zlabel('$|G_2(f,g)|$','interpreter','latex','FontSize',16);
% convolution
im06_flt = conv2(im06_flt,g2,'same');   % filter the image
figure('name',im_name06);
imshow(im06_flt,[])
title('$y(k,l) = x(k,l)**g_1(k,l)**g_2(k,l)$','interpreter','latex','FontSize',16) 

%% Exercise 3.4 - Correlation 

im_name07 = 'g-letter.png';           
im07 = imread(im_name07);

% rescaling - range [-128,127]
im06_flt_scal = rescale(im06_flt,-128,127);
im07_scal = rescale(im07,-128,127);

% noise 
sigma = [5 10 25 40 50];    % standard deviation
 
% adapting matricies for convolution
im07_freq = fftshift(fft2(im07_scal));
im07_freq_inv = im07_freq(end:-1:1,end:-1:1);   % reverse
im07_freq_conv = conj(im07_freq_inv);           % conjugate
im07_scal_inv = im07_scal(end:-1:1,end:-1:1);
im06_freq = fftshift(fft2(im06_flt_scal));

    
% noiseless 
figure('name','noiseless correlation')
corr_space = conv2(im06_flt_scal, im07_scal_inv,'same');   % spatial domain
corr_freq = conv2(im06_freq, im07_freq_conv,'same');       % frequency domain

subplot(1,2,1); mesh(corr_space);
title('Spatial domain','interpreter','latex','FontSize',16);
subplot(1,2,2); mesh(abs(corr_freq));
title('Frequency domain','interpreter','latex','FontSize',16);
sgtitle('\textbf{Image Correlation}','interpreter','latex','FontSize',18);

% maximum 
maxval = zeros(length(sigma)+1,2);
M1 = max(corr_space,[],'all');
[maxval(1,1), maxval(1,2)] = find(corr_space == M1);      % maximum correlation -> g letter

% noisy
figure('name','noisy correlation')
for i = 1:length(sigma)
    im06_noise = im06_flt_scal + sigma(i)^2*randn(size(im06_flt_scal));    % image with noise
    rescale(im06_noise,-128,127);       % limited dynamic range
    im06_noise_freq = fftshift(fft2(im06_noise));
    % correlation
    corr_space = conv2(im06_noise, im07_scal_inv);
    corr_freq = conv2(im06_noise_freq, im07_freq_conv);
    subplot(2,5,i); mesh(corr_space);
    title(['$\sigma$ = ' num2str(sigma(i))],'interpreter','latex','FontSize',16);
    subplot(2,5,i+5); mesh(abs(corr_freq));
    title(['$\sigma$ = ' num2str(sigma(i))],'interpreter','latex','FontSize',16);
    
    % maximum
    M1 = max(corr_space,[],'all');
    [maxval(i+1,1), maxval(i+1,2)] = find(corr_space == M1);      % maximum correlation -> g letter

end    
sgtitle('\textbf{Spatial and Frequency Correlation}','interpreter','latex','FontSize',18);


%% Exercise 3.5 - Resampling
% close all
% clear all
% clc

im_name08 = 'sub4.tif';
im08 = imread(im_name08);
figure('name',im_name08);

subplot(1,3,1); imshow(im08);
title('original','interpreter','latex','FontSize',16);
subplot(1,3,2); imshow(im08(1:2:size(im08,1),1:2:size(im08,2)));    % resampling x2
title('downsample x2','interpreter','latex','FontSize',16);
subplot(1,3,3); imshow(im08(1:4:size(im08,1),1:4:size(im08,2)));
title('downsample x4','interpreter','latex','FontSize',16);         % resampling x4
sgtitle('\textbf{Resampling}','interpreter','latex','FontSize',16);

%% Exercise 3.6 - Phase and magnitude of the 2DFT
% close all
% clear variables
% clc

im_name05 = 'lena-y.png';           
im05 = imread(im_name05);           % intensity grey level

% EX-1
% Fourier transforms
A = fft2(im05);
a_real = real(ifft2(real(A)));      % setting the imaginary part to zero
a_imag = real(ifft2(1j*imag(A)));   % setting the real part to zero

figure('name',im_name05);
subplot(1,2,1); imshow(a_real,[]);
title('$F^{-1}\{Re[F\{x(k,l)\}]\}$','interpreter','latex','FontSize',16);
subplot(1,2,2); imshow(a_imag,[]);
title('$F^{-1}\{Im[F\{x(k,l)\}]\}$','interpreter','latex','FontSize',16);
% spatial relation
figure('name',im_name05)
imshow((a_real+a_imag),[])
title('$F^{-1}\{Re[F\{x(k,l)\}]+Im[F\{x(k,l)\}]\}$','interpreter','latex','FontSize',16);

% EX-2
a_mag = ifft2(abs(A));              % magnitude information
% a_phase = real(ifft2(exp(1j*angle(A))));
a_phase = real(ifft2(A./abs(A)));   % phase information
figure();
subplot(1,2,1); imshow(log(a_mag-min(a_mag(:))+1),[]);
title('Magnitude','interpreter','latex','FontSize',16);
subplot(1,2,2); imshow(a_phase,[]);
title('Phase','interpreter','latex','FontSize',16);

%% Exercie 3.7 - Weber law
% close all
% clear variables
% clc

L1 = 50;
L2 = 70;
Lb = 10;
weber(L1,L2,Lb);

% Weber constants determined experimentally
C1 = [0.8/20, 1.5/50, 1.5/80, 1.5/110, 1.6/140, 2/170, 3.3/200, 4/230];
C2 = [1/20, 1.5/50, 1.5/80, 1.5/110, 1.5/140, 1.5/170, 2/200, 2.3/230];

L1 = 20:30:230;
figure;
plot(L1,C1);
hold on, grid on
plot(L1,C2);
legend('$L_b = 10$','$L_b = 200$','interpreter','latex','FontSize',16);
title('Weber constant $\frac{\Delta L}{L_1}$','interpreter','latex','FontSize',16);
xlabel('$L_1$','interpreter','latex','FontSize',16);
ylabel('$\frac{\Delta L}{L_1}$','interpreter','latex','FontSize',16);














