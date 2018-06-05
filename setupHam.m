function H = setupHam( N, J, isPeriodic )
% This function setups the Hamiltonian for a half spin chain rings.
% 
% Inputs:   N:      (INT) Number of half spins in the system.
%           J:      (FLT) Constant
% Output:   H:      (2^Nx2^N FLT) Hamiltonian operator.

S = setupS(N);

H = zeros(2^N);

for k = 1:N-1
    H = H + S(:,:,k)'*S(:,:,k+1);
end

if isPeriodic
    H = H + S(:,:,N)'*S(:,:,1);
end

H = J*H;

end

