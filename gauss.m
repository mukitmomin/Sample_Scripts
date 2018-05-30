A = vander(1: .2: 2);
b = [0 1 0 1 0 1]';

[x, det] = gauss_sol(A,b);

function [x, det] = gauss_sol(A,b)

if size(b,2) > 1; b = b'; end
n = length(b);
for k = 1:n-1
    for i = k+1:n
        if A(i,k) ~= 0
            lambda = A(i,k)/A(k,k);
            A(i,k+1:n) = A(i,k+1:n) - lambda*A(k,k+1:n);
            b(i) = b(i) - lambda*b(k);
        end
    end
end

% calculating the determinant
if nargout == 2; det = prod(diag(A)); end

% back substituition phase
for k = n:-1:1  
    b(k) = (b(k) - A(k,k+1:n)*b(k+1:n)) / A(k,k);
end
x=b;

end

