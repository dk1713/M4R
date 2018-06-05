%% Topological pairing

%% Initialise
Jz = 0.5;
Jx = 1;
Jy = 1;
systemSize = 4;

Sx = [[0,1];[1,0]];
Sy = [[0,-1i];[1i,0]];
Sz = [[1,0];[0,-1]];

%%
H = setupXYZ(systemSize, Jx, Jy, Jz);   %Ham for XYZ
Dx = setupD(systemSize, Sx);            %Dx
S = setupSz(systemSize);                %Total Spin

option.tol = 1e-10;
[Q, A, B] = simdiag(H, Dx, option);

A = diag(A);
B = diag(B);
%%
figure('rend','painters','pos',[10 10 200 600]);
plot(-B, A, 'r+');

% %%
% figure('rend','painters','pos',[10 10 200 600]);
% plot(-Dx, E, 'r+');

% %%
% figure('rend','painters','pos',[10 10 600 600]);
% plot(E(1:10), 'r+');