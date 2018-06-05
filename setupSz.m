function S = setupSz( N )
% This function sets up the S.
%
% Inputs:
%   index:  (INT) Index position of the spin.
%   N:      (INT) Number of half spins in the system.
%   spin:   (2 x 2 FLT) Pauli operator.
% Output:   
%   S:      (2^N x 2^N FLT) Spin Operators (Kronecker Pauli)

Sz = [[1,0];[0,-1]];
S = zeros(2^N);

for j = 1:N
    S = S + setupKron(j, N, Sz);
end

end