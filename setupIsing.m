function H = setupIsing( N, J, Jz, isPeriodic )
% This function setups the Hamiltonian for a transverse Ising Model.
% 
% Inputs:   N:      (INT) Number of half spins in the system.
%           J:      (FLT) Constant
% Output:   H:      (2^Nx2^N FLT) Hamiltonian operator.

A = setupA(N);

Hx = zeros(2^N);
Hz = zeros(2^N);

for k = 1:N-1
    Hx = Hx + (A(:,:,k)' - A(:,:,k))*(A(:,:,k+1) + A(:,:,k+1)');
end

if isPeriodic
    Hx = Hx + (A(:,:,N)' - A(:,:,N))*(A(:,:,1) + A(:,:,1)');
end

Hx = J*Hx;

for k = 1:N
    Hz = Hz + (A(:,:,k)*A(:,:,k)' - A(:,:,k)'*A(:,:,k));
end

Hz = Jz*Hz;

H = Hx + Hz;

end