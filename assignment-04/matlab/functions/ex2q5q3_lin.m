function [Pearson_lin, Spearman_lin, RMSE_lin] = ex2q5q3_lin
% function relative to question 2.5.3 Benchmarking 
% linear fitting is applied
load DMOS
load CI
load MOS

%%  point-to-point MSE distance
load error_MSE_pcc_geo
load error_MSE_cwi_plc


obj_metric = [error_MSE_pcc_geo; error_MSE_cwi_plc];
p_lin = polyfit(obj_metric(:),MOS,1);
obj_metric = p_lin(1)*obj_metric(:)+p_lin(2);
obj_metric = reshape(obj_metric,[8 4]);

figure('name','Benchmarking - linear')
subplot(2,3,1)
errorbar(obj_metric(:,1),DMOS(1:8),CI(1:8),'o'); hold on
errorbar(obj_metric(:,2),DMOS(9:16),CI(9:16),'o')
errorbar(obj_metric(:,3),DMOS(17:24),CI(17:24),'o')
errorbar(obj_metric(:,4),DMOS(25:32),CI(25:32),'o')
title('DMOS vs PointToPoint - MSE','interpreter','latex','FontSize',14);
%legend('longdress','guanyin','phil','rhetorician','Location','northwest','interpreter','latex','FontSize',12);
ylabel('DMOS','interpreter','latex','FontSize',14);
xlabel('point-to-point - MSE','interpreter','latex','FontSize',14);
grid on

Pearson_lin(1) = corr(obj_metric(:),MOS,'type','Pearson');
Spearman_lin(1) = corr(obj_metric(:),MOS,'type','Spearman');
RMSE_lin(1) = sqrt(sum((obj_metric(:)-MOS).^2)/(length(MOS)));

%% plane-to-plane HAU distance
load error_HAU_pcc_geo
load error_HAU_cwi_plc

obj_metric = [error_HAU_pcc_geo; error_HAU_cwi_plc];
p_lin = polyfit(obj_metric(:),MOS,1);
obj_metric = p_lin(1)*obj_metric(:)+p_lin(2);
obj_metric = reshape(obj_metric,[8 4]);

subplot(2,3,2)
errorbar(obj_metric(:,1),DMOS(1:8),CI(1:8),'o'); hold on
errorbar(obj_metric(:,2),DMOS(9:16),CI(9:16),'o')
errorbar(obj_metric(:,3),DMOS(17:24),CI(17:24),'o')
errorbar(obj_metric(:,4),DMOS(25:32),CI(25:32),'o')
title('DMOS vs PointToPoint - Hausdorff','interpreter','latex','FontSize',14);
%legend('longdress','guanyin','phil','rhetorician','Location','southwest','interpreter','latex','FontSize',12);
ylabel('DMOS','interpreter','latex','FontSize',14);
xlabel('point-to-point - HAU','interpreter','latex','FontSize',14);
grid on

Pearson_lin(2) = corr(obj_metric(:),MOS,'type','Pearson');
Spearman_lin(2) = corr(obj_metric(:),MOS,'type','Spearman');
RMSE_lin(2) = sqrt(sum((obj_metric(:)-MOS).^2)/(length(MOS)));

%% plane-to-plane MSE distance
load asSym_pcc_geo
load asSym_cwi_plc

obj_metric = [asSym_pcc_geo; asSym_cwi_plc];
p_lin = polyfit(obj_metric(:),MOS,1);
obj_metric = p_lin(1)*obj_metric(:)+p_lin(2);
obj_metric = reshape(obj_metric,[8 4]);

subplot(2,3,3)
errorbar(obj_metric(:,1),DMOS(1:8),CI(1:8),'o'); hold on
errorbar(obj_metric(:,2),DMOS(9:16),CI(9:16),'o')
errorbar(obj_metric(:,3),DMOS(17:24),CI(17:24),'o')
errorbar(obj_metric(:,4),DMOS(25:32),CI(25:32),'o')
title('DMOS vs PlaneToPlane','interpreter','latex','FontSize',14);
%legend('longdress','guanyin','phil','rhetorician','Location','southeast','interpreter','latex','FontSize',12);
ylabel('DMOS','interpreter','latex','FontSize',14);
xlabel('plane-to-plane - MSE','interpreter','latex','FontSize',14);
grid on
Pearson_lin(3) = corr(obj_metric(:),MOS,'type','Pearson');
Spearman_lin(3) = corr(obj_metric(:),MOS,'type','Spearman');
RMSE_lin(3) = sqrt(sum((obj_metric(:)-MOS).^2)/(length(MOS)));

%% PSNR
load PSNR_yuv_pcc_geo
load PSNR_avr_pcc_geo
load PSNR_pcc_geo
load PSNR_yuv_cwi_plc
load PSNR_avr_cwi_plc
load PSNR_cwi_plc

% PSNR
obj_metric = [PSNR_pcc_geo; PSNR_cwi_plc];
p_lin = polyfit(obj_metric(:),MOS,1);
obj_metric = p_lin(1)*obj_metric(:)+p_lin(2);
obj_metric = reshape(obj_metric,[8 4]);

subplot(2,3,4)
errorbar(obj_metric(:,1),DMOS(1:8),CI(1:8),'o'); hold on
errorbar(obj_metric(:,2),DMOS(9:16),CI(9:16),'o')
errorbar(obj_metric(:,3),DMOS(17:24),CI(17:24),'o')
errorbar(obj_metric(:,4),DMOS(25:32),CI(25:32),'o')
title('DMOS vs $PSNR$','interpreter','latex','FontSize',14);
%legend('longdress','guanyin','phil','rhetorician','Location','southeast','interpreter','latex','FontSize',12);
ylabel('DMOS','interpreter','latex','FontSize',14);
xlabel('$PSNR$','interpreter','latex','FontSize',14);
grid on

Pearson_lin(4) = corr(obj_metric(:),MOS,'type','Pearson');
Spearman_lin(4) = corr(obj_metric(:),MOS,'type','Spearman');
RMSE_lin(4) = sqrt(sum((obj_metric(:)-MOS).^2)/(length(MOS)));

% PSNR averaged
obj_metric = [PSNR_avr_pcc_geo; PSNR_avr_cwi_plc];
p_lin = polyfit(obj_metric(:),MOS,1);
obj_metric = p_lin(1)*obj_metric(:)+p_lin(2);
obj_metric = reshape(obj_metric,[8 4]);

subplot(2,3,5)
errorbar(obj_metric(:,1),DMOS(1:8),CI(1:8),'o'); hold on
errorbar(obj_metric(:,2),DMOS(9:16),CI(9:16),'o')
errorbar(obj_metric(:,3),DMOS(17:24),CI(17:24),'o')
errorbar(obj_metric(:,4),DMOS(25:32),CI(25:32),'o')
title('DMOS vs $PSNR_{avr}$','interpreter','latex','FontSize',14);
%legend('longdress','guanyin','phil','rhetorician','Location','southeast','interpreter','latex','FontSize',12);
ylabel('DMOS','interpreter','latex','FontSize',14);
xlabel('$PSNR_{avr}$','interpreter','latex','FontSize',14);
grid on
Pearson_lin(5) = corr(obj_metric(:),MOS,'type','Pearson');
Spearman_lin(5) = corr(obj_metric(:),MOS,'type','Spearman');
RMSE_lin(5) = sqrt(sum((obj_metric(:)-MOS).^2)/(length(MOS)));

% PSNR yuv
obj_metric = [PSNR_yuv_pcc_geo; PSNR_yuv_cwi_plc];
p_lin = polyfit(obj_metric(:),MOS,1);
obj_metric = p_lin(1)*obj_metric(:)+p_lin(2);
obj_metric = reshape(obj_metric,[8 4]);

subplot(2,3,6)
errorbar(obj_metric(:,1),DMOS(1:8),CI(1:8),'o'); hold on
errorbar(obj_metric(:,2),DMOS(9:16),CI(9:16),'o')
errorbar(obj_metric(:,3),DMOS(17:24),CI(17:24),'o')
errorbar(obj_metric(:,4),DMOS(25:32),CI(25:32),'o')
title('DMOS vs $PSNR_{yuv}$','interpreter','latex','FontSize',14);
%legend('longdress','guanyin','phil','rhetorician','Location','southeast','interpreter','latex','FontSize',12);
ylabel('DMOS','interpreter','latex','FontSize',14);
xlabel('$PSNR_{yuv}$','interpreter','latex','FontSize',14);
grid on
Pearson_lin(6) = corr(obj_metric(:),MOS,'type','Pearson');
Spearman_lin(6) = corr(obj_metric(:),MOS,'type','Spearman');
RMSE_lin(6) = sqrt(sum((obj_metric(:)-MOS).^2)/(length(MOS)));
end