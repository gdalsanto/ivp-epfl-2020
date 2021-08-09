function ex2q4q2(pointCloud_IVP,data)
% ex2q4q2(pointCloud_IVP,data)
% % function relative to question 2.4.2 Objective quality assessment 
% compute the symmetricplane-to-plane metric with MSE 
% asSym : symmestric plane-to-plane metric
bpp = table2array(data(:,6));

% longdress

[~, ~, asSym_pcc_geo(1,1)] = angularSimilarity(pointCloud_IVP.longdress.pcc_geo_color.l1, pointCloud_IVP.longdress.Reference, 'MSE');
[~, ~, asSym_pcc_geo(2,1)] = angularSimilarity(pointCloud_IVP.longdress.pcc_geo_color.l2, pointCloud_IVP.longdress.Reference, 'MSE');
[~, ~, asSym_pcc_geo(3,1)] = angularSimilarity(pointCloud_IVP.longdress.pcc_geo_color.l3, pointCloud_IVP.longdress.Reference, 'MSE');
[~, ~, asSym_pcc_geo(4,1)] = angularSimilarity(pointCloud_IVP.longdress.pcc_geo_color.l4, pointCloud_IVP.longdress.Reference, 'MSE');
[~, ~, asSym_cwi_plc(1,1)] = angularSimilarity(pointCloud_IVP.longdress.cwi_plc.l1, pointCloud_IVP.longdress.Reference, 'MSE');
[~, ~, asSym_cwi_plc(2,1)] = angularSimilarity(pointCloud_IVP.longdress.cwi_plc.l2, pointCloud_IVP.longdress.Reference, 'MSE');
[~, ~, asSym_cwi_plc(3,1)] = angularSimilarity(pointCloud_IVP.longdress.cwi_plc.l3, pointCloud_IVP.longdress.Reference, 'MSE');
[~, ~, asSym_cwi_plc(4,1)] = angularSimilarity(pointCloud_IVP.longdress.cwi_plc.l4, pointCloud_IVP.longdress.Reference, 'MSE');

figure('name', 'angular similarity - MSE'); 
subplot(1,4,1);
plot(bpp(1:4), asSym_pcc_geo(:,1),'-x'); hold on
plot(bpp(5:8), asSym_cwi_plc(:,1),'-x')
xlabel('Bitrate/bpp','interpreter','latex','FontSize',14);
ylabel('plane-to-plane','interpreter','latex','FontSize',14);
%%legend('pcc geo color','cwi pcl','Location','southeast','interpreter','latex','FontSize',14)
title('longdress','interpreter','latex','FontSize',14)
grid on


% guanyin

[~, ~, asSym_pcc_geo(1,2)] = angularSimilarity(pointCloud_IVP.guanyin.pcc_geo_color.l1, pointCloud_IVP.guanyin.Reference, 'MSE');
[~, ~, asSym_pcc_geo(2,2)] = angularSimilarity(pointCloud_IVP.guanyin.pcc_geo_color.l2, pointCloud_IVP.guanyin.Reference, 'MSE');
[~, ~, asSym_pcc_geo(3,2)] = angularSimilarity(pointCloud_IVP.guanyin.pcc_geo_color.l3, pointCloud_IVP.guanyin.Reference, 'MSE');
[~, ~, asSym_pcc_geo(4,2)] = angularSimilarity(pointCloud_IVP.guanyin.pcc_geo_color.l4, pointCloud_IVP.guanyin.Reference, 'MSE');
[~, ~, asSym_cwi_plc(1,2)] = angularSimilarity(pointCloud_IVP.guanyin.cwi_plc.l1, pointCloud_IVP.guanyin.Reference, 'MSE');
[~, ~, asSym_cwi_plc(2,2)] = angularSimilarity(pointCloud_IVP.guanyin.cwi_plc.l2, pointCloud_IVP.guanyin.Reference, 'MSE');
[~, ~, asSym_cwi_plc(3,2)] = angularSimilarity(pointCloud_IVP.guanyin.cwi_plc.l3, pointCloud_IVP.guanyin.Reference, 'MSE');
[~, ~, asSym_cwi_plc(4,2)] = angularSimilarity(pointCloud_IVP.guanyin.cwi_plc.l4, pointCloud_IVP.guanyin.Reference, 'MSE');

subplot(1,4,2);
plot(bpp(9:12), asSym_pcc_geo(:,2),'-x'); hold on
plot(bpp(13:16), asSym_cwi_plc(:,2),'-x')
xlabel('Bitrate/bpp','interpreter','latex','FontSize',14);
ylabel('plane-to-plane','interpreter','latex','FontSize',14);
%legend('pcc geo color','cwi pcl','Location','southeast','interpreter','latex','FontSize',14)
title('guanyin','interpreter','latex','FontSize',14)
grid on


% phil

[~, ~, asSym_pcc_geo(1,3)] = angularSimilarity(pointCloud_IVP.phil.pcc_geo_color.l1, pointCloud_IVP.phil.Reference, 'MSE');
[~, ~, asSym_pcc_geo(2,3)] = angularSimilarity(pointCloud_IVP.phil.pcc_geo_color.l2, pointCloud_IVP.phil.Reference, 'MSE');
[~, ~, asSym_pcc_geo(3,3)] = angularSimilarity(pointCloud_IVP.phil.pcc_geo_color.l3, pointCloud_IVP.phil.Reference, 'MSE');
[~, ~, asSym_pcc_geo(4,3)] = angularSimilarity(pointCloud_IVP.phil.pcc_geo_color.l4, pointCloud_IVP.phil.Reference, 'MSE');
[~, ~, asSym_cwi_plc(1,3)] = angularSimilarity(pointCloud_IVP.phil.cwi_plc.l1, pointCloud_IVP.phil.Reference, 'MSE');
[~, ~, asSym_cwi_plc(2,3)] = angularSimilarity(pointCloud_IVP.phil.cwi_plc.l2, pointCloud_IVP.phil.Reference, 'MSE');
[~, ~, asSym_cwi_plc(3,3)] = angularSimilarity(pointCloud_IVP.phil.cwi_plc.l3, pointCloud_IVP.phil.Reference, 'MSE');
[~, ~, asSym_cwi_plc(4,3)] = angularSimilarity(pointCloud_IVP.phil.cwi_plc.l4, pointCloud_IVP.phil.Reference, 'MSE');


subplot(1,4,3);
plot(bpp(17:20), asSym_pcc_geo(:,3),'-x'); hold on
plot(bpp(21:24), asSym_cwi_plc(:,3),'-x')
xlabel('Bitrate/bpp','interpreter','latex','FontSize',14);
ylabel('plane-to-plane','interpreter','latex','FontSize',14);
%legend('pcc geo color','cwi pcl','Location','southeast','interpreter','latex','FontSize',14)
title('phil','interpreter','latex','FontSize',14)
grid on

% rhetorician

[~, ~, asSym_pcc_geo(1,4)] = angularSimilarity(pointCloud_IVP.rhetorician.pcc_geo_color.l1, pointCloud_IVP.rhetorician.Reference, 'MSE');
[~, ~, asSym_pcc_geo(2,4)] = angularSimilarity(pointCloud_IVP.rhetorician.pcc_geo_color.l2, pointCloud_IVP.rhetorician.Reference, 'MSE');
[~, ~, asSym_pcc_geo(3,4)] = angularSimilarity(pointCloud_IVP.rhetorician.pcc_geo_color.l3, pointCloud_IVP.rhetorician.Reference, 'MSE');
[~, ~, asSym_pcc_geo(4,4)] = angularSimilarity(pointCloud_IVP.rhetorician.pcc_geo_color.l4, pointCloud_IVP.rhetorician.Reference, 'MSE');
[~, ~, asSym_cwi_plc(1,4)] = angularSimilarity(pointCloud_IVP.rhetorician.cwi_plc.l1, pointCloud_IVP.rhetorician.Reference, 'MSE');
[~, ~, asSym_cwi_plc(2,4)] = angularSimilarity(pointCloud_IVP.rhetorician.cwi_plc.l2, pointCloud_IVP.rhetorician.Reference, 'MSE');
[~, ~, asSym_cwi_plc(3,4)] = angularSimilarity(pointCloud_IVP.rhetorician.cwi_plc.l3, pointCloud_IVP.rhetorician.Reference, 'MSE');
[~, ~, asSym_cwi_plc(4,4)] = angularSimilarity(pointCloud_IVP.rhetorician.cwi_plc.l4, pointCloud_IVP.rhetorician.Reference, 'MSE');


subplot(1,4,4);
plot(bpp(25:28), asSym_pcc_geo(:,4),'-x'); hold on
plot(bpp(29:32), asSym_cwi_plc(:,4),'-x')
xlabel('Bitrate/bpp','interpreter','latex','FontSize',14);
ylabel('plane-to-plane','interpreter','latex','FontSize',14);
%legend('pcc geo color','cwi pcl','Location','southeast','interpreter','latex','FontSize',14)
title('rhetorician','interpreter','latex','FontSize',14)
grid on

save('asSym_pcc_geo.mat','asSym_pcc_geo');
save('asSym_cwi_plc.mat','asSym_cwi_plc');
end
