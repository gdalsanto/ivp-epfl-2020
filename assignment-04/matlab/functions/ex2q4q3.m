function ex2q4q3(pointCloud_IVP,data)
% ex2q4q3(pointCloud_IVP,data)
% function relative to question 2.4.3 Objective quality assessment 
% compute the symmetric color-PSNR in the RGB colorspace and in YUV colorspace 

bpp = table2array(data(:,6));

% longdress

[PSNR_pcc_geo(1,1), PSNR_avr_pcc_geo(1,1), PSNR_yuv_pcc_geo(1,1)] = color_metrics_psnr(pointCloud_IVP.longdress.pcc_geo_color.l1,pointCloud_IVP.longdress.Reference);
[PSNR_pcc_geo(2,1), PSNR_avr_pcc_geo(2,1), PSNR_yuv_pcc_geo(2,1)] = color_metrics_psnr(pointCloud_IVP.longdress.pcc_geo_color.l2,pointCloud_IVP.longdress.Reference);
[PSNR_pcc_geo(3,1), PSNR_avr_pcc_geo(3,1), PSNR_yuv_pcc_geo(3,1)] = color_metrics_psnr(pointCloud_IVP.longdress.pcc_geo_color.l3,pointCloud_IVP.longdress.Reference);
[PSNR_pcc_geo(4,1), PSNR_avr_pcc_geo(4,1), PSNR_yuv_pcc_geo(4,1)] = color_metrics_psnr(pointCloud_IVP.longdress.pcc_geo_color.l4,pointCloud_IVP.longdress.Reference);
[PSNR_cwi_plc(1,1), PSNR_avr_cwi_plc(1,1), PSNR_yuv_cwi_plc(1,1)] = color_metrics_psnr(pointCloud_IVP.longdress.cwi_plc.l1,pointCloud_IVP.longdress.Reference);
[PSNR_cwi_plc(2,1), PSNR_avr_cwi_plc(2,1), PSNR_yuv_cwi_plc(2,1)] = color_metrics_psnr(pointCloud_IVP.longdress.cwi_plc.l2,pointCloud_IVP.longdress.Reference);
[PSNR_cwi_plc(3,1), PSNR_avr_cwi_plc(3,1), PSNR_yuv_cwi_plc(3,1)] = color_metrics_psnr(pointCloud_IVP.longdress.cwi_plc.l3,pointCloud_IVP.longdress.Reference);
[PSNR_cwi_plc(4,1), PSNR_avr_cwi_plc(4,1), PSNR_yuv_cwi_plc(4,1)] = color_metrics_psnr(pointCloud_IVP.longdress.cwi_plc.l4,pointCloud_IVP.longdress.Reference);

figure('name', 'angular similarity - MSE'); 
subplot(3,4,1);
plot(bpp(1:4), PSNR_pcc_geo(:,1),'-x'); hold on
plot(bpp(5:8), PSNR_cwi_plc(:,1),'-x')
xlabel('Bitrate/bpp','interpreter','latex','FontSize',14);
ylabel('$PSNR$','interpreter','latex','FontSize',14);
%legend('pcc geo color','cwi pcl','Location','southeast','interpreter','latex','FontSize',12)
title('\textbf{$PSNR$} - longdress','interpreter','latex','FontSize',14)
grid on
subplot(3,4,5);
plot(bpp(1:4), PSNR_avr_pcc_geo(:,1),'-x'); hold on
plot(bpp(5:8), PSNR_avr_cwi_plc(:,1),'-x')
xlabel('Bitrate/bpp','interpreter','latex','FontSize',14);
ylabel('$PSNR_{avr}$','interpreter','latex','FontSize',14);
%legend('pcc geo color','cwi pcl','Location','southeast','interpreter','latex','FontSize',12)
title('\textbf{$PSNR_{avr}$} - longdress','interpreter','latex','FontSize',14)
grid on
subplot(3,4,9);
plot(bpp(1:4), PSNR_yuv_pcc_geo(:,1),'-x'); hold on
plot(bpp(5:8), PSNR_yuv_cwi_plc(:,1),'-x')
xlabel('Bitrate/bpp','interpreter','latex','FontSize',14);
ylabel('$PSNR_{YUV}$','interpreter','latex','FontSize',14);
%legend('pcc geo color','cwi pcl','Location','southeast','interpreter','latex','FontSize',12)
title('\textbf{$PSNR_{YUV}$} - longdress','interpreter','latex','FontSize',14)
grid on




% guanyin

[PSNR_pcc_geo(1,2), PSNR_avr_pcc_geo(1,2), PSNR_yuv_pcc_geo(1,2)] = color_metrics_psnr(pointCloud_IVP.guanyin.pcc_geo_color.l1,pointCloud_IVP.guanyin.Reference);
[PSNR_pcc_geo(2,2), PSNR_avr_pcc_geo(2,2), PSNR_yuv_pcc_geo(2,2)] = color_metrics_psnr(pointCloud_IVP.guanyin.pcc_geo_color.l2,pointCloud_IVP.guanyin.Reference);
[PSNR_pcc_geo(3,2), PSNR_avr_pcc_geo(3,2), PSNR_yuv_pcc_geo(3,2)] = color_metrics_psnr(pointCloud_IVP.guanyin.pcc_geo_color.l3,pointCloud_IVP.guanyin.Reference);
[PSNR_pcc_geo(4,2), PSNR_avr_pcc_geo(4,2), PSNR_yuv_pcc_geo(4,2)] = color_metrics_psnr(pointCloud_IVP.guanyin.pcc_geo_color.l4,pointCloud_IVP.guanyin.Reference);
[PSNR_cwi_plc(1,2), PSNR_avr_cwi_plc(1,2), PSNR_yuv_cwi_plc(1,2)] = color_metrics_psnr(pointCloud_IVP.guanyin.cwi_plc.l1,pointCloud_IVP.guanyin.Reference);
[PSNR_cwi_plc(2,2), PSNR_avr_cwi_plc(2,2), PSNR_yuv_cwi_plc(2,2)] = color_metrics_psnr(pointCloud_IVP.guanyin.cwi_plc.l2,pointCloud_IVP.guanyin.Reference);
[PSNR_cwi_plc(3,2), PSNR_avr_cwi_plc(3,2), PSNR_yuv_cwi_plc(3,2)] = color_metrics_psnr(pointCloud_IVP.guanyin.cwi_plc.l3,pointCloud_IVP.guanyin.Reference);
[PSNR_cwi_plc(4,2), PSNR_avr_cwi_plc(4,2), PSNR_yuv_cwi_plc(4,2)] = color_metrics_psnr(pointCloud_IVP.guanyin.cwi_plc.l4,pointCloud_IVP.guanyin.Reference);

subplot(3,4,2);
plot(bpp(9:12), PSNR_pcc_geo(:,2),'-x'); hold on
plot(bpp(13:16), PSNR_cwi_plc(:,2),'-x')
xlabel('Bitrate/bpp','interpreter','latex','FontSize',14);
ylabel('$PSNR$','interpreter','latex','FontSize',14);
%legend('pcc geo color','cwi pcl','Location','southeast','interpreter','latex','FontSize',12)
title('\textbf{$PSNR$} - guanyin','interpreter','latex','FontSize',14)
grid on
subplot(3,4,6);
plot(bpp(9:12), PSNR_avr_pcc_geo(:,2),'-x'); hold on
plot(bpp(13:16), PSNR_avr_cwi_plc(:,2),'-x')
xlabel('Bitrate/bpp','interpreter','latex','FontSize',14);
ylabel('$PSNR_{avr}$','interpreter','latex','FontSize',14);
%legend('pcc geo color','cwi pcl','Location','southeast','interpreter','latex','FontSize',12)
title('\textbf{$PSNR_{avr}$} - guanyin','interpreter','latex','FontSize',14)
grid on
subplot(3,4,10);
plot(bpp(9:12), PSNR_yuv_pcc_geo(:,2),'-x'); hold on
plot(bpp(13:16), PSNR_yuv_cwi_plc(:,2),'-x')
xlabel('Bitrate/bpp','interpreter','latex','FontSize',14);
ylabel('$PSNR_{YUV}$','interpreter','latex','FontSize',14);
%legend('pcc geo color','cwi pcl','Location','southeast','interpreter','latex','FontSize',12)
title('\textbf{$PSNR_{YUV}$} - guanyin','interpreter','latex','FontSize',14)
grid on




% phil

[PSNR_pcc_geo(1,3), PSNR_avr_pcc_geo(1,3), PSNR_yuv_pcc_geo(1,3)] = color_metrics_psnr(pointCloud_IVP.phil.pcc_geo_color.l1,pointCloud_IVP.phil.Reference);
[PSNR_pcc_geo(2,3), PSNR_avr_pcc_geo(2,3), PSNR_yuv_pcc_geo(2,3)] = color_metrics_psnr(pointCloud_IVP.phil.pcc_geo_color.l2,pointCloud_IVP.phil.Reference);
[PSNR_pcc_geo(3,3), PSNR_avr_pcc_geo(3,3), PSNR_yuv_pcc_geo(3,3)] = color_metrics_psnr(pointCloud_IVP.phil.pcc_geo_color.l3,pointCloud_IVP.phil.Reference);
[PSNR_pcc_geo(4,3), PSNR_avr_pcc_geo(4,3), PSNR_yuv_pcc_geo(4,3)] = color_metrics_psnr(pointCloud_IVP.phil.pcc_geo_color.l4,pointCloud_IVP.phil.Reference);
[PSNR_cwi_plc(1,3), PSNR_avr_cwi_plc(1,3), PSNR_yuv_cwi_plc(1,3)] = color_metrics_psnr(pointCloud_IVP.phil.cwi_plc.l1,pointCloud_IVP.phil.Reference);
[PSNR_cwi_plc(2,3), PSNR_avr_cwi_plc(2,3), PSNR_yuv_cwi_plc(2,3)] = color_metrics_psnr(pointCloud_IVP.phil.cwi_plc.l2,pointCloud_IVP.phil.Reference);
[PSNR_cwi_plc(3,3), PSNR_avr_cwi_plc(3,3), PSNR_yuv_cwi_plc(3,3)] = color_metrics_psnr(pointCloud_IVP.phil.cwi_plc.l3,pointCloud_IVP.phil.Reference);
[PSNR_cwi_plc(4,3), PSNR_avr_cwi_plc(4,3), PSNR_yuv_cwi_plc(4,3)] = color_metrics_psnr(pointCloud_IVP.phil.cwi_plc.l4,pointCloud_IVP.phil.Reference);

subplot(3,4,3);
plot(bpp(17:20), PSNR_pcc_geo(:,3),'-x'); hold on
plot(bpp(21:24), PSNR_cwi_plc(:,3),'-x')
xlabel('Bitrate/bpp','interpreter','latex','FontSize',14);
ylabel('$PSNR$','interpreter','latex','FontSize',14);
%legend('pcc geo color','cwi pcl','Location','southeast','interpreter','latex','FontSize',12)
title('\textbf{$PSNR$} - phil','interpreter','latex','FontSize',14)
grid on
subplot(3,4,7);
plot(bpp(17:20), PSNR_avr_pcc_geo(:,3),'-x'); hold on
plot(bpp(21:24), PSNR_avr_cwi_plc(:,3),'-x')
xlabel('Bitrate/bpp','interpreter','latex','FontSize',14);
ylabel('$PSNR_{avr}$','interpreter','latex','FontSize',14);
%legend('pcc geo color','cwi pcl','Location','southeast','interpreter','latex','FontSize',12)
title('\textbf{$PSNR_{avr}$} - phil','interpreter','latex','FontSize',14)
grid on
subplot(3,4,11);
plot(bpp(17:20), PSNR_yuv_pcc_geo(:,3),'-x'); hold on
plot(bpp(21:24), PSNR_yuv_cwi_plc(:,3),'-x')
xlabel('Bitrate/bpp','interpreter','latex','FontSize',14);
ylabel('$PSNR_{YUV}$','interpreter','latex','FontSize',14);
%legend('pcc geo color','cwi pcl','Location','southeast','interpreter','latex','FontSize',12)
title('\textbf{$PSNR_{YUV}$} - phil','interpreter','latex','FontSize',14)
grid on




% rhetorician

[PSNR_pcc_geo(1,4), PSNR_avr_pcc_geo(1,4), PSNR_yuv_pcc_geo(1,4)] = color_metrics_psnr(pointCloud_IVP.rhetorician.pcc_geo_color.l1,pointCloud_IVP.rhetorician.Reference);
[PSNR_pcc_geo(2,4), PSNR_avr_pcc_geo(2,4), PSNR_yuv_pcc_geo(2,4)] = color_metrics_psnr(pointCloud_IVP.rhetorician.pcc_geo_color.l2,pointCloud_IVP.rhetorician.Reference);
[PSNR_pcc_geo(3,4), PSNR_avr_pcc_geo(3,4), PSNR_yuv_pcc_geo(3,4)] = color_metrics_psnr(pointCloud_IVP.rhetorician.pcc_geo_color.l3,pointCloud_IVP.rhetorician.Reference);
[PSNR_pcc_geo(4,4), PSNR_avr_pcc_geo(4,4), PSNR_yuv_pcc_geo(4,4)] = color_metrics_psnr(pointCloud_IVP.rhetorician.pcc_geo_color.l4,pointCloud_IVP.rhetorician.Reference);
[PSNR_cwi_plc(1,4), PSNR_avr_cwi_plc(1,4), PSNR_yuv_cwi_plc(1,4)] = color_metrics_psnr(pointCloud_IVP.rhetorician.cwi_plc.l1,pointCloud_IVP.rhetorician.Reference);
[PSNR_cwi_plc(2,4), PSNR_avr_cwi_plc(2,4), PSNR_yuv_cwi_plc(2,4)] = color_metrics_psnr(pointCloud_IVP.rhetorician.cwi_plc.l2,pointCloud_IVP.rhetorician.Reference);
[PSNR_cwi_plc(3,4), PSNR_avr_cwi_plc(3,4), PSNR_yuv_cwi_plc(3,4)] = color_metrics_psnr(pointCloud_IVP.rhetorician.cwi_plc.l3,pointCloud_IVP.rhetorician.Reference);
[PSNR_cwi_plc(4,4), PSNR_avr_cwi_plc(4,4), PSNR_yuv_cwi_plc(4,4)] = color_metrics_psnr(pointCloud_IVP.rhetorician.cwi_plc.l4,pointCloud_IVP.rhetorician.Reference);



subplot(3,4,4);
plot(bpp(25:28), PSNR_pcc_geo(:,4),'-x'); hold on
plot(bpp(29:32), PSNR_cwi_plc(:,4),'-x')
xlabel('Bitrate/bpp','interpreter','latex','FontSize',14);
ylabel('$PSNR$','interpreter','latex','FontSize',14);
%legend('pcc geo color','cwi pcl','Location','southeast','interpreter','latex','FontSize',12)
title('\textbf{$PSNR$} - rhetorician','interpreter','latex','FontSize',14)
grid on
subplot(3,4,8);
plot(bpp(25:28), PSNR_avr_pcc_geo(:,4),'-x'); hold on
plot(bpp(29:32), PSNR_avr_cwi_plc(:,4),'-x')
xlabel('Bitrate/bpp','interpreter','latex','FontSize',14);
ylabel('$PSNR_{avr}$','interpreter','latex','FontSize',14);
%legend('pcc geo color','cwi pcl','Location','southeast','interpreter','latex','FontSize',12)
title('\textbf{$PSNR_{avr}$} - rhetorician','interpreter','latex','FontSize',14)
grid on
subplot(3,4,12);
plot(bpp(25:28), PSNR_yuv_pcc_geo(:,4),'-x'); hold on
plot(bpp(29:32), PSNR_yuv_cwi_plc(:,4),'-x')
xlabel('Bitrate/bpp','interpreter','latex','FontSize',14);
ylabel('$PSNR_{YUV}$','interpreter','latex','FontSize',14);
%legend('pcc geo color','cwi pcl','Location','southeast','interpreter','latex','FontSize',12)
title('\textbf{$PSNR_{YUV}$} - rhetorician','interpreter','latex','FontSize',14)
grid on

save('PSNR_pcc_geo.mat','PSNR_pcc_geo');
save('PSNR_cwi_plc.mat','PSNR_cwi_plc');
save('PSNR_avr_pcc_geo.mat','PSNR_avr_pcc_geo');
save('PSNR_avr_cwi_plc.mat','PSNR_avr_cwi_plc');
save('PSNR_yuv_pcc_geo.mat','PSNR_yuv_pcc_geo');
save('PSNR_yuv_cwi_plc.mat','PSNR_yuv_cwi_plc');
