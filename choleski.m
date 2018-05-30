A = [ 4 -2 2
-2 2 -4
2 -4 11];

L = choleski_decom(A)

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

            