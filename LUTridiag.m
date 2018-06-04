

function [c,d,e] = LUdec3(c,d,e)

n = length(d);

% as indexing in matlab starts from 1
for k = 2:n
   
    lambda = c(k-1)/d(k-1);
    d(k) = d(k) - lambda*e(k-1);
    c(k-1) = lambda;
end

end

function x = LUsol3(c,d,e,b)

n = length(d);

% forward substituition, solving Ly = b
for k = 2:n
   b(k) = b(k) - c(k-1)*b(k-1);
end

% backward substition, solving Ux=y
for k = n-1: -1: 1
    b(k) = (b(k) - e(k)*b(k+1))/d(k);
end
x = b
end