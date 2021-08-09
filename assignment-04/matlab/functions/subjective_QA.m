function [DMOS, CI] = subjective_QA(subj_ratings)
% [DMOS, CI] = subjective_QA(data);
% subjective quality assessment
% subj_ratings : subjective ratings 
% DOMS : Differential Mean Opinion Score
% CI : Confidence Interval

M = size(subj_ratings,1) - 4 ;      % number of stimuli (esc. reference)
N = size(subj_ratings,2);           % number of subjects
DV = zeros(M,N);    % Differential Viewer scores              
 
for i = 1 : 4
    start_idx = (i-1)*9+2;
    DV((i-1)*8+1:i*8,:) = subj_ratings(start_idx:start_idx+7,:) - repmat(subj_ratings((i-1)*9+1,:),8,1) + 5; 
end
DMOS = sum(DV,2)/N;
save('DMOS.mat','DMOS');
sigma = std(subj_ratings,0,2);      % unbiased standard deviation 
sigma([1:9:end]) = [];
alpha = 0.05;                       % significance level
CI = icdf('T',1-alpha/2,N-1)*sigma/sqrt(N);     % confidence interval
save('CI.mat','CI');
end