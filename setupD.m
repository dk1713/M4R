function D = setupD( N, spin )
% This function setups the Hamiltonian for an XY 1/2-spin model.
% 
% Inputs:   
%   N:      (INT) Number of half spins in the system.
%   type:   (2 x 2 FLT) Pauli operator.
% Output:   
%   D:      (2^Nx2^N FLT) symmetry operator.

D = spin;

for k = 1:N - 1
    D = kron( D, spin );
end

end