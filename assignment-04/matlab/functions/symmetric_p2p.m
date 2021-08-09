function [error_MSE, error_HAU] = symmetric_p2p(A,B)
% [error_MSE, error_HAU] = symmetric_p2p(A,B)
% compute the symmetric point-to-point metric using MSE and Hausdorff distance
% error_MSE : maximum error using Mean Squared Error
% error_HAU : maximum error using Hausdorff
% A,B : matrix to be compared where each row is a set of coordinates x,y,z

A = double(A);
B = double(B);

% A as reference
Idx_1 = knnsearch(A,B);  
dist = B;
ref = A(Idx_1,:);
for i=1:length(Idx_1)
    err_1(i) = sqrt(sum((dist(i,:) - ref(i,:)).^2));
end
% B as reference
Idx_2 = knnsearch(B,A);  
dist = A;
ref = B(Idx_2,:);
for i=1:length(Idx_2)
    err_2(i) = sqrt(sum((dist(i,:) - ref(i,:)).^2));
end

error_MSE = max(sum(err_1.^2)/size(err_1, 1), sum(err_2.^2)/size(err_2, 1));
error_HAU = max(max(err_1), max(err_2));

end