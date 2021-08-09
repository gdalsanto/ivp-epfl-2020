function plot_DMOS(data, DMOS, CI)
% plot_DMOS(subj_val, DMOS, CI)
% plots the DMOS vs bpp with confidence interval

% indexing 
c = {1:4,9:12,17:20,25:28;5:8,13:16,21:24,29:32};       % cell array of indexes 
names = {'\textbf{longdress}','\textbf{guanyin}','\textbf{phil}','\textbf{rhetorician}'};
figure('name', 'DMOS - CI'); 
    for i = 1:4  
        subplot(1,4,i)
        errorbar(table2array(data(cell2mat(c(1,i)),6)),DMOS(cell2mat(c(1,i))),CI(cell2mat(c(1,i))),'-o'); hold on
        errorbar(table2array(data(cell2mat(c(2,i)),6)),DMOS(cell2mat(c(2,i))),CI(cell2mat(c(2,i))),'-x');
        xlabel('Bitrate/bpp','interpreter','latex','FontSize',14);
        ylabel('DMOS','interpreter','latex','FontSize',14);
        %%legend('pcc geo color','cwi pcl','Location','southeast','interpreter','latex','FontSize',14)
        title(names(i),'interpreter','latex','FontSize',14)
        grid on
    end
end