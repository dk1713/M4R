function [eigD, eigH] = solveXXZ2( systemSize, J, Jz, Sz)

Sx = [[0,1];[1,0]];

H = setupXYZ(systemSize, J, J, Jz);   %Ham for XYZ %TODO maybe make this input
% Dx = setupD(systemSize, Sx);            %Dx
S = diag(setupSz(systemSize));          %Total Spin

index = find(abs(S) == abs(Sz));

H = H(index,index);
Dx = setupDx(length(index));

disp(find(H*Dx - Dx*H));

option.tol = 1e-10;
[Q, eigD, eigH] = simdiag(Dx, H, option);

eigD = diag(eigD);
eigH = diag(eigH);
end

