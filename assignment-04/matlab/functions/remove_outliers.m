function filtered_data = remove_outliers(subj_ratings)
% filtered_data = remove_outliers(data)
% implements the algorithm described in ITU-T Recommendation P.913 in order
% to detect and remove the outliers from the subjective ratings
% subj_ratings : subjective ratings 
% filtered_data : filtered subjective rating 

N = size(subj_ratings,2);           % numbers of subjects
M = size(subj_ratings,1);           % number of stimuli (including references)
M2 = 9;                     % number of stimulis for a context         

r1 = zeros(N,1);            % coefficent for individual stimuli
r2 = zeros(N,1);            % coefficent for all the stimuli
x1 = zeros(N,1);            % MOS of all subjects for each stimulus
x2 = zeros(4,1);            % MOS of all subject for all stimuli for each context
y1 = zeros(N,1);            % individual score of j
y2 = zeros(4,1);            % MOS of each subject for all the stimuli of a context

ind = zeros(N,1);

filtered_data = subj_ratings;
stop = 0;
while stop == 0
    
    % r_1 individual stimuli
    x1 = mean(subj_ratings,2);       
    for j = 1 : N
        y1 = subj_ratings(:,j);      
        % r1(j) = plcc(x1,y1,M);  
        r1(j) = corr(x1,y1,'Type','Pearson');   % PLCC for individual stimuli 
    end
    
    % r_2 contents
    for i = 1 : 4
    x2(i) = sum(x1((i-1)*M2+1:i*M2));
    end
    x2 = x2/M2;             
    for j = 1 : N
        for i = 1 : 4
            y2(i) = sum(subj_ratings((i-1)*M2+1:i*M2,j))/M2;
        end
        % r2(j) = plcc(x2,y2,4);
        r2(j) = corr(x2,y2,'Type','Pearson');
    end
    
    % outliers detection
    ind = logical(r1<0.75) & logical(r2<0.8);
    if sum(ind) ~= 0
        indx = find(ind);
        worse_outlier = indx(1);
        for i = 2 : length(indx)
            if ((0.75 - r1(worse_outlier)) + (0.8 - r2(worse_outlier))) ...
                    <= ((0.75 - r1(i)) + (0.8 - r2(i)))
                worse_outlier = indx(i);
            end
        end
        subj_ratings(:,worse_outlier) = [];
        N = N - 1;
    else 
        stop = 1;
    end
end

if isequal(filtered_data,subj_ratings)
    disp('No outliers detected');
else 
    filtered_data = subj_ratings;
end
end