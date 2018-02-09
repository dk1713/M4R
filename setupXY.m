function Ham = setupXY( N, Jx, Jy, h )
% This function setups the Hamiltonian for an XY 1/2-spin model.
% 
% Inputs:   N:      (INT) Number of half spins in the system.
%           J:      (FLT) Constant
% Output:   H:      (2^Nx2^N FLT) Hamiltonian operator.

Sx = [[0,1];[1,0]];
Sy = 1i*[[0,-1];[1,0]];
Sz = [[1,0];[0,-1]];

Sxx = setupKron(Sx, N);
Syy = setupKron(Sy, N);
Szz = setupKron(Sz, N);

Ham = zeros(2^N);

for k = 1:N-1
    Ham = Ham ...
        - Jx*Sxx(:,:,k)*Sxx(:,:,k+1) ...
        - Jy*Syy(:,:,k)*Syy(:,:,k+1) ...
        - h*Szz(:,:,k);
end

Ham = Ham ...
    - Jx*Sxx(:,:,N)*Sxx(:,:,1) ...
    - Jy*Syy(:,:,N)*Syy(:,:,1) ...
    - h*Szz(:,:,N); % periodic condition

end