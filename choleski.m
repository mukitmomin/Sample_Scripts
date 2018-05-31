A = [ 1.44  -.36    5.52    0.0
    -.36    10.33   -7.78   0.0
    5.52    -7.78   28.4    9.0
    0.0     0.0     9.0     61.0];

L = choleski_decom(A)

b = [0.04 -2.15 0 .88]' % b has to be a column vector

x = choleskiSoln(L,b)

% A = LL'. This fucntion calculated L given A
function L = choleski_decom(A)
    n = size(A,1);
    
    for j = 1:n
        % calculating the diagonal terms first
        temp = A(j,j) - dot(A(j, 1:j-1), A(j, 1:j-1));
        disp(temp)
        if temp < 0.0
            error('Matrix is not positive definite')
        end
        
        A(j,j) = sqrt(temp);
        
        % calculating the non-diagonal terms
        for i=j+1:n
            A(i,j) = (A(i,j) - dot(A(i,1:j-1), A(j, 1:j-1)))/ A(j,j);
        end
        
    end
    
    L = tril(A)
    
end

function x = choleskiSoln(L,b)
% solves [L][L']{x} = {b}

n = length(b);   % the constants vector

if size(b,2) > 1; b = b'; end

for k = 1:n     % forward substituition soln of [L]{y} = {b}
   b(k) = ( b(k) - dot(L(k, 1:k-1), b(1:k-1)'))/L(k,k); 
end

% back substituition solution of [L']{x} = {y}
for k = n: -1: 1
    b(k) = ( b(k) - dot(L(k+1:n, k),b(k+1:n))) / L(k,k);
end

x = b;

end      