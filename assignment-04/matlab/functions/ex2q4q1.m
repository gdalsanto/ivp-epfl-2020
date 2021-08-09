function  ex2q4q1(pointCloud_IVP,data)
% ex2q4q1(pointCloud_IVP,data)
% function relative to question 2.4.1 Objective quality assessment 
% computes the symmestric point-to-point metric using MSE and Hausdorff distance
% error_MSE : MSE distance
% error_HAU : Hausdorff distance
bpp = table2array(data(:,6));

% longdress
[error_MSE_pcc_geo(1,1), error_HAU_pcc_geo(1,1) ] = symmetric_p2p(pointCloud_IVP.longdress.pcc_geo_color.l1.Location,pointCloud_IVP.longdress.Reference.Location);
[error_MSE_cwi_plc(1,1), error_HAU_cwi_plc(1,1) ] = symmetric_p2p(pointCloud_IVP.longdress.cwi_plc.l1.Location,pointCloud_IVP.longdress.Reference.Location);
[error_MSE_pcc_geo(2,1), error_HAU_pcc_geo(2,1) ] = symmetric_p2p(pointCloud_IVP.longdress.pcc_geo_color.l2.Location, pointCloud_IVP.longdress.Reference.Location);
[error_MSE_cwi_plc(2,1), error_HAU_cwi_plc(2,1) ] = symmetric_p2p(pointCloud_IVP.longdress.cwi_plc.l2.Location, pointCloud_IVP.longdress.Reference.Location);
[error_MSE_pcc_geo(3,1), error_HAU_pcc_geo(3,1) ] = symmetric_p2p(pointCloud_IVP.longdress.pcc_geo_color.l3.Location, pointCloud_IVP.longdress.Reference.Location);
[error_MSE_cwi_plc(3,1), error_HAU_cwi_plc(3,1) ] = symmetric_p2p(pointCloud_IVP.longdress.cwi_plc.l3.Location, pointCloud_IVP.longdress.Reference.Location);
[error_MSE_pcc_geo(4,1), error_HAU_pcc_geo(4,1) ] = symmetric_p2p(pointCloud_IVP.longdress.pcc_geo_color.l4.Location, pointCloud_IVP.longdress.Reference.Location);
[error_MSE_cwi_plc(4,1), error_HAU_cwi_plc(4,1) ] = symmetric_p2p(pointCloud_IVP.longdress.cwi_plc.l4.Location, pointCloud_IVP.longdress.Reference.Location);


figure('name', 'symmetric_p2p - MSE'); 
subplot(2,4,1);
plot(bpp(1:4), error_MSE_pcc_geo(:,1),'-x'); hold on
plot(bpp(5:8), error_MSE_cwi_plc(:,1),'-x')
xlabel('Bitrate/bpp','interpreter','latex','FontSize',14);
ylabel('point-to-point','interpreter','latex','FontSize',14);
%%legend('pcc geo color','cwi pcl','interpreter','latex','FontSize',14)
title('\textbf{MSE} - longdress','interpreter','latex','FontSize',14)
grid on
subplot(2,4,5);
plot(bpp(1:4), error_HAU_pcc_geo(:,1),'-x'); hold on
plot(bpp(5:8), error_HAU_cwi_plc(:,1),'-x')
xlabel('Bitrate/bpp','interpreter','latex','FontSize',14);
ylabel('point-to-point','interpreter','latex','FontSize',14);
%legend('pcc geo color','cwi pcl','interpreter','latex','FontSize',14)
title('\textbf{Hausdorff} - longdress','interpreter','latex','FontSize',14)
grid on


% guanyin
[error_MSE_pcc_geo(1,2), error_HAU_pcc_geo(1,2) ] = symmetric_p2p(pointCloud_IVP.guanyin.pcc_geo_color.l1.Location,pointCloud_IVP.guanyin.Reference.Location);
[error_MSE_cwi_plc(1,2), error_HAU_cwi_plc(1,2) ] = symmetric_p2p(pointCloud_IVP.guanyin.cwi_plc.l1.Location,pointCloud_IVP.guanyin.Reference.Location);
[error_MSE_pcc_geo(2,2), error_HAU_pcc_geo(2,2) ] = symmetric_p2p(pointCloud_IVP.guanyin.pcc_geo_color.l2.Location, pointCloud_IVP.guanyin.Reference.Location);
[error_MSE_cwi_plc(2,2), error_HAU_cwi_plc(2,2) ] = symmetric_p2p(pointCloud_IVP.guanyin.cwi_plc.l2.Location, pointCloud_IVP.guanyin.Reference.Location);
[error_MSE_pcc_geo(3,2), error_HAU_pcc_geo(3,2) ] = symmetric_p2p(pointCloud_IVP.guanyin.pcc_geo_color.l3.Location, pointCloud_IVP.guanyin.Reference.Location);
[error_MSE_cwi_plc(3,2), error_HAU_cwi_plc(3,2) ] = symmetric_p2p(pointCloud_IVP.guanyin.cwi_plc.l3.Location, pointCloud_IVP.guanyin.Reference.Location);
[error_MSE_pcc_geo(4,2), error_HAU_pcc_geo(4,2) ] = symmetric_p2p(pointCloud_IVP.guanyin.pcc_geo_color.l4.Location, pointCloud_IVP.guanyin.Reference.Location);
[error_MSE_cwi_plc(4,2), error_HAU_cwi_plc(4,2) ] = symmetric_p2p(pointCloud_IVP.guanyin.cwi_plc.l4.Location, pointCloud_IVP.guanyin.Reference.Location);

subplot(2,4,2);
plot(bpp(9:12), error_MSE_pcc_geo(:,2),'-x'); hold on
plot(bpp(13:16), error_MSE_cwi_plc(:,2),'-x')
xlabel('Bitrate/bpp','interpreter','latex','FontSize',14);
ylabel('point-to-point','interpreter','latex','FontSize',14);
%legend('pcc geo color','cwi pcl','interpreter','latex','FontSize',14)
title('\textbf{MSE} - guanyin','interpreter','latex','FontSize',14)
grid on
subplot(2,4,6);
plot(bpp(9:12), error_HAU_pcc_geo(:,2),'-x'); hold on
plot(bpp(13:16), error_HAU_cwi_plc(:,2),'-x')
xlabel('Bitrate/bpp','interpreter','latex','FontSize',14);
ylabel('point-to-point','interpreter','latex','FontSize',14);
%legend('pcc geo color','cwi pcl','interpreter','latex','FontSize',14)
title('\textbf{Hausdorff} - guanyin','interpreter','latex','FontSize',14)
grid on


% phil
[error_MSE_pcc_geo(1,3), error_HAU_pcc_geo(1,3) ] = symmetric_p2p(pointCloud_IVP.phil.pcc_geo_color.l1.Location,pointCloud_IVP.phil.Reference.Location);
[error_MSE_cwi_plc(1,3), error_HAU_cwi_plc(1,3) ] = symmetric_p2p(pointCloud_IVP.phil.cwi_plc.l1.Location,pointCloud_IVP.phil.Reference.Location);
[error_MSE_pcc_geo(2,3), error_HAU_pcc_geo(2,3) ] = symmetric_p2p(pointCloud_IVP.phil.pcc_geo_color.l2.Location, pointCloud_IVP.phil.Reference.Location);
[error_MSE_cwi_plc(2,3), error_HAU_cwi_plc(2,3) ] = symmetric_p2p(pointCloud_IVP.phil.cwi_plc.l2.Location, pointCloud_IVP.phil.Reference.Location);
[error_MSE_pcc_geo(3,3), error_HAU_pcc_geo(3,3) ] = symmetric_p2p(pointCloud_IVP.phil.pcc_geo_color.l3.Location, pointCloud_IVP.phil.Reference.Location);
[error_MSE_cwi_plc(3,3), error_HAU_cwi_plc(3,3) ] = symmetric_p2p(pointCloud_IVP.phil.cwi_plc.l3.Location, pointCloud_IVP.phil.Reference.Location);
[error_MSE_pcc_geo(4,3), error_HAU_pcc_geo(4,3) ] = symmetric_p2p(pointCloud_IVP.phil.pcc_geo_color.l4.Location, pointCloud_IVP.phil.Reference.Location);
[error_MSE_cwi_plc(4,3), error_HAU_cwi_plc(4,3) ] = symmetric_p2p(pointCloud_IVP.phil.cwi_plc.l4.Location, pointCloud_IVP.phil.Reference.Location);

subplot(2,4,3);
plot(bpp(17:20), error_MSE_pcc_geo(:,3),'-x'); hold on
plot(bpp(21:24), error_MSE_cwi_plc(:,3),'-x')
xlabel('Bitrate/bpp','interpreter','latex','FontSize',14);
ylabel('point-to-point','interpreter','latex','FontSize',14);
%legend('pcc geo color','cwi pcl','interpreter','latex','FontSize',14)
title('\textbf{MSE} - phil','interpreter','latex','FontSize',14)
grid on
subplot(2,4,7);
plot(bpp(17:20), error_HAU_pcc_geo(:,3),'-x'); hold on
plot(bpp(21:24), error_HAU_cwi_plc(:,3),'-x')
xlabel('Bitrate/bpp','interpreter','latex','FontSize',14);
ylabel('point-to-point','interpreter','latex','FontSize',14);
%legend('pcc geo color','cwi pcl','interpreter','latex','FontSize',14)
title('\textbf{Hausdorff} - phil','interpreter','latex','FontSize',14)
grid on


% rhetorician
[error_MSE_pcc_geo(1,4), error_HAU_pcc_geo(1,4) ] = symmetric_p2p(pointCloud_IVP.rhetorician.pcc_geo_color.l1.Location,pointCloud_IVP.rhetorician.Reference.Location);
[error_MSE_cwi_plc(1,4), error_HAU_cwi_plc(1,4) ] = symmetric_p2p(pointCloud_IVP.rhetorician.cwi_plc.l1.Location,pointCloud_IVP.rhetorician.Reference.Location);
[error_MSE_pcc_geo(2,4), error_HAU_pcc_geo(2,4) ] = symmetric_p2p(pointCloud_IVP.rhetorician.pcc_geo_color.l2.Location, pointCloud_IVP.rhetorician.Reference.Location);
[error_MSE_cwi_plc(2,4), error_HAU_cwi_plc(2,4) ] = symmetric_p2p(pointCloud_IVP.rhetorician.cwi_plc.l2.Location, pointCloud_IVP.rhetorician.Reference.Location);
[error_MSE_pcc_geo(3,4), error_HAU_pcc_geo(3,4) ] = symmetric_p2p(pointCloud_IVP.rhetorician.pcc_geo_color.l3.Location, pointCloud_IVP.rhetorician.Reference.Location);
[error_MSE_cwi_plc(3,4), error_HAU_cwi_plc(3,4) ] = symmetric_p2p(pointCloud_IVP.rhetorician.cwi_plc.l3.Location, pointCloud_IVP.rhetorician.Reference.Location);
[error_MSE_pcc_geo(4,4), error_HAU_pcc_geo(4,4) ] = symmetric_p2p(pointCloud_IVP.rhetorician.pcc_geo_color.l4.Location, pointCloud_IVP.rhetorician.Reference.Location);
[error_MSE_cwi_plc(4,4), error_HAU_cwi_plc(4,4) ] = symmetric_p2p(pointCloud_IVP.rhetorician.cwi_plc.l4.Location, pointCloud_IVP.rhetorician.Reference.Location);

subplot(2,4,4);
plot(bpp(25:28), error_MSE_pcc_geo(:,4),'-x'); hold on
plot(bpp(29:32), error_MSE_cwi_plc(:,4),'-x')
xlabel('Bitrate/bpp','interpreter','latex','FontSize',14);
ylabel('point-to-point','interpreter','latex','FontSize',14);
%legend('pcc geo color','cwi pcl','interpreter','latex','FontSize',14)
title('\textbf{MSE} - rhetorician','interpreter','latex','FontSize',14)
grid on
subplot(2,4,8);
plot(bpp(25:28), error_HAU_pcc_geo(:,4),'-x'); hold on
plot(bpp(29:32), error_HAU_cwi_plc(:,4),'-x')
xlabel('Bitrate/bpp','interpreter','latex','FontSize',14);
ylabel('point-to-point','interpreter','latex','FontSize',14);
%legend('pcc geo color','cwi pcl','interpreter','latex','FontSize',14)
title('\textbf{Hausdorff} - rhetorician','interpreter','latex','FontSize',14)
grid on

save('error_MSE_pcc_geo.mat','error_MSE_pcc_geo');
save('error_MSE_cwi_plc.mat','error_MSE_cwi_plc');
save('error_HAU_pcc_geo.mat','error_HAU_pcc_geo');
save('error_HAU_cwi_plc.mat','error_HAU_cwi_plc');
end