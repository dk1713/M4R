function A = setupA( N )
% This function sets up the Fermi Operators.
%
% Inputs:   N:      (INT) Number of half spins in the system.
% Output:   S:      (2^N x 2^N x N FLT) Spin Operators (Kronecker Pauli)

A = eye(2);
% Set up Pauli Operators
Sz = 0.5*[[1,0];[0,-1]];

fu = [[0, 1]; [0, 0]];

A = zeros(2^N,2^N,N);

for k = 1:N
    front = 1;
    back = 1;
    if k > 1
        for j = 1:k - 1
            front = kron(front,Sz);
        end
    end
    
    Suu = kron(front,fu);
    
    if k < N
        back = eye(2^(N-k));
    end
    
    A(:,:,k) = -kron(Suu,back);
end

end

