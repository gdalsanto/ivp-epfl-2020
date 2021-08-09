function [PSNR, PSNR_rgb, PSNR_yuv] = color_metrics_psnr(B,A)
% [PSNR, PSNR_rgb, PSNR_yuv] = color_metrics_psnr(B,ref)

% A = ref
% B = double(B); 
% A = double(A);
Idx = knnsearch(A.Location,B.Location);
PSNR_BA = psnr(B.Color,A.Color(Idx,:));     % peakvalue 255
PSNR_rgb_BA = (psnr(B.Color(:,1),A.Color(Idx,1)) + ...
            psnr(B.Color(:,2),A.Color(Idx,2)) + ...
            psnr(B.Color(:,3),A.Color(Idx,3)))/3;

% RGB to YUV
[B_yuv(:,1), B_yuv(:,2), B_yuv(:,3)] = rgb2yuv(B.Color(:,1),B.Color(:,2),B.Color(:,3));
[A_yuv(:,1), A_yuv(:,2), A_yuv(:,3)] = rgb2yuv(A.Color(Idx,1),A.Color(Idx,2),A.Color(Idx,3));

PSNR_yuv_BA = (psnr(B_yuv(:,1),A_yuv(:,1)) + ...
            psnr(B_yuv(:,2),A_yuv(:,2)) + ...
            psnr(B_yuv(:,3),A_yuv(:,3)))/3;
clear A_yuv
clear B_yuv
% B = ref 
temp = B;
B = A; 
A = temp;
Idx = knnsearch(A.Location,B.Location);
PSNR_AB = psnr(B.Color,A.Color(Idx,:));     % peakvalue 255
PSNR_rgb_AB = (psnr(B.Color(:,1),A.Color(Idx,1)) + ...
            psnr(B.Color(:,2),A.Color(Idx,2)) + ...
            psnr(B.Color(:,3),A.Color(Idx,3)))/3;

[B_yuv(:,1), B_yuv(:,2), B_yuv(:,3)] = rgb2yuv(B.Color(:,1),B.Color(:,2),B.Color(:,3));
[A_yuv(:,1), A_yuv(:,2), A_yuv(:,3)] = rgb2yuv(A.Color(Idx,1),A.Color(Idx,2),A.Color(Idx,3));

PSNR_yuv_AB = (6*psnr(B_yuv(:,1),A_yuv(:,1)) + ...
            psnr(B_yuv(:,2),A_yuv(:,2)) + ...
            psnr(B_yuv(:,3),A_yuv(:,3)))/8;
        
PSNR = max(PSNR_AB,PSNR_BA);
PSNR_rgb = max(PSNR_rgb_AB,PSNR_rgb_BA);
PSNR_yuv = max(PSNR_yuv_AB,PSNR_yuv_BA);
end

