function Ham = setupXYZ( varargin )
% This function setups the Hamiltonian for an XY 1/2-spin model.
% 
% Inputs:   N:      (INT) Number of half spins in the system.
%           J:      (FLT) Constant
% Output:   H:      (2^Nx2^N FLT) Hamiltonian operator.

if isstruct(varargin{end})
	option.bc = varargin{end}.bc;
else
	option.bc = true;
end

N = varargin{1};
Jx = varargin{2};
Jy = varargin{3};
Jz = varargin{4};

Sx = [[0,1];[1,0]];
Sy = [[0,-1i];[1i,0]];
Sz = [[1,0];[0,-1]];

Ham = Jx*setupKronPair(N,Sx, option) ...
    + Jy*setupKronPair(N,Sy, option) ...
    + Jz*setupKronPair(N,Sz, option);

end