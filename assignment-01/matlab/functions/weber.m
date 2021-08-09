% Weber image for constant determination
% L1, L2: parameters of intensity
% Lb: background intensity
function X = weber(L1, L2, Lb)
    x1 = 600;   y1 = 600;       % size of matrix X, in pixels
    x2 = 80;    y2 = 160;
    X = Lb*ones(y1,x1);         % background
    
    x0 = (x1-2*x2)/2;
    y0 = (y1-y2)/2;
    X(y0:(y0+y2-1),x0:(x0+x2-1)) = L1*ones(y2,x2);
    X(y0:(y0+y2-1),(x0+x2):(x0+2*x2-1)) = L2*ones(y2,x2);
    
    figure('name','Weber');
    imshow(uint8(X));
    title(['L_1: ' num2str(L1) ' - L_2: ' num2str(L2) ' - L_b: ' num2str(Lb)])
end