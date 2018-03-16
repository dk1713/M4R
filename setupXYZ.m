function Ham = setupXYZ( N, Jx, Jy, Jz )
% This function setups the Hamiltonian for an XY 1/2-spin model.
% 
% Inputs:   N:      (INT) Number of half spins in the system.
%           J:      (FLT) Constant
% Output:   H:      (2^Nx2^N FLT) Hamiltonian operator.

Sx = [[0,1];[1,0]];
Sy = [[0,-1i];[1i,0]];
Sz = [[1,0];[0,-1]];

Ham = zeros(2^N);

for k = 1:N - 1 % for non-periodic iterate upto N - 1
    Ham = Ham ...
        + Jx*setupKronPair(k,N,Sx) ...
        + Jy*setupKronPair(k,N,Sy) ...
        + Jz*setupKronPair(k,N,Sz);
end

end