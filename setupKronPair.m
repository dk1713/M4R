function S = setupKronPair( index, N, spin )
% This function sets up the S interacting adjacent pairs.
%
% Inputs:
%   index:  (INT) Index position of the spin.
%   N:      (INT) Number of half spins in the system.
%   spin:   (2 x 2 FLT) Pauli operator.
% Output:   
%   S:      (2^N x 2^N FLT) Spin Operators (Kronecker Pauli)

if index < N
    spin2 = kron(spin, spin);
    
    S = kron( eye(2^(index - 1)), spin2 );
    S = kron( S, eye(2^(N - 1 - index)) );
else
    S = kron( spin, eye(2^(N - 2)) );
    S = kron( S, spin );
end

end