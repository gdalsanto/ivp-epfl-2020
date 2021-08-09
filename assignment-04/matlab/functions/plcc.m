function plcc = plcc(x,y,n)
    x = x(:);   % make sure that they are colums
    y = y(:);
    
    plcc = (n*x'*y - sum(x)*sum(y))/(sqrt(n*sum(x.^2)-sum(x)^2)*(sqrt(n*sum(y.^2)-sum(y).^2)));
end