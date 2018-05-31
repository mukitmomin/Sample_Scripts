function A = LU_decomposition(A)

n = size(A,1);
for k = 1:n-1
   for i = k+1:n
       % going row by row
       if A(i,k) ~= 0.0
           lambda = A(i,k)/A(k,k);
           % gaussian elimination
           A(i, k+1:n) = A(i,k+1:n) - lambda*A(k, k+1:n);
           % elements of L are lambda, the multipliers
           A(i,k) = lambda;
       end
   end
end
