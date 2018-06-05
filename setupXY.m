function Ham = setupXY( N, Jx, Jy, h )
% This function setups the Hamiltonian for an XY 1/2-spin model.
% 
% Inputs:   N:      (INT) Number of half spins in the system.
%           J:      (FLT) Constant
% Output:   H:      (2^Nx2^N FLT) Hamiltonian operator.

Sx = [[0,1];[1,0]];
Sy = 1i*[[0,-1];[1,0]];
Sz = [[1,0];[0,-1]];

Ham = zeros(2^N);

for k = 1:N-1
    Ham = Ham ...
        - Jx*setupKron(k,N,Sx)*setupKron(k+1,N,Sx) ...
        - Jy*setupKron(k,N,Sy)*setupKron(k+1,N,Sy) ...
        - h*setupKron(k,N,Sz);
end

Ham = Ham ...
    - Jx*setupKron(N,N,Sx)*setupKron(1,N,Sx) ...
    - Jy*setupKron(N,N,Sy)*setupKron(1,N,Sy) ...
    - h*setupKron(N,N,Sz); % periodic condition

end