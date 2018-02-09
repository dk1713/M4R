function S = setupS( N )
% This function sets up the S.
%
% Inputs:   N:      (INT) Number of half spins in the system.
% Output:   S:      (2^N x 2^N x N FLT) Spin Operators (Kronecker Pauli)

A = eye(2);
% Set up Pauli Operators
Sx = 0.5*[[0,1];[1,0]];
Sy = 0.5i*[[0,-1];[1,0]];
Sz = 0.5*[[1,0];[0,-1]];

S = zeros(3*2^N,2^N,N);

for k = 1:N
    front = 1;
    back = 1;
    if k > 1
        front = eye(2^(k-1));
    end
    
    Sxx = kron(front,Sx);
    Syy = kron(front,Sy);
    Szz = kron(front,Sz);
    
    if k < N
        back = eye(2^(N-k));
    end
    
    S(:,:,k) = [kron(Sxx,back); kron(Syy,back); kron(Szz,back)];
end

end

