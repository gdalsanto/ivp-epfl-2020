function evaluate_MOS(subj_ratings)
% MOS = evaluate_MOS(subj_ratings)
% computes the Mean Opinion Scores of the given subjective ratings
indx = {1:8,9:16,17:24,25:32};
N = size(subj_ratings,2);   % number of subjects

for i = 1 : 4
    MOS(cell2mat(indx(i))) = sum(subj_ratings(cell2mat(indx(i))+1,:),2);
end
MOS = MOS'/N;
save('MOS.mat','MOS');
end
