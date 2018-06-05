function totalSS = setupKronPair( varargin )
% This function sets up the S interacting adjacent pairs.
%
% Inputs:
%   index:  (INT) Index position of the spin.
%   N:      (INT) Number of half spins in the system.
%   spin:   (2 x 2 FLT) Pauli operator.
% Output:   
%   S:      (2^N x 2^N FLT) Spin Operators (Kronecker Pauli)

if isstruct(varargin{end})
	isPeriodic = varargin{end}.bc;
else
	isPeriodic = true;
end

N = varargin{1};
spin = varargin{2};

spin2 = kron(spin, spin);
totalSS = kron( spin2 , eye(2^(N-2)) ); %setup first interactions

for j = 2:N - 1
    S = kron( eye(2^(j - 1)), spin2 );
    S = kron( S, eye(2^(N - 1 - j)) );
    totalSS = totalSS + S;
end

if isPeriodic
    S = kron( spin, eye(2^(N - 2)) );
    S = kron( S, spin );
    totalSS = totalSS + S;
end

end