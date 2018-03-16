function S = setupKron( index, N, spin )
% This function sets up the S.
%
% Inputs:
%   index:  (INT) Index position of the spin.
%   N:      (INT) Number of half spins in the system.
%   spin:   (2 x 2 FLT) Pauli operator.
% Output:   
%   S:      (2^N x 2^N FLT) Spin Operators (Kronecker Pauli)

front = 1;
back = 1;
    
if index > 1
    front = eye(2^(index-1));
end
    
Sx = kron(front,spin);
    
if index < N
    back = eye(2^(N-index));
end
    
S = kron(Sx,back);

end