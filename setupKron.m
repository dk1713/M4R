function S = setupKron( spin, N )
% This function sets up the S.
%
% Inputs:   N:      (INT) Number of half spins in the system.
% Output:   S:      (2^N x 2^N x N FLT) Spin Operators (Kronecker Pauli)

S = zeros(2^N,2^N,N);

for k = 1:N
    front = 1;
    back = 1;
    
    if k > 1
        front = eye(2^(k-1));
    end
    
    Sx = kron(front,spin);
    
    if k < N
        back = eye(2^(N-k));
    end
    
    S(:,:,k) = kron(Sx,back);
end

end