%% Topological pairing

%% Initialise
Jz = 4;
Jx = 1;
Jy = 1;
systemSize = 10;

Sx = [[0,1];[1,0]];
Sy = [[0,-1i];[1i,0]];
Sz = [[1,0];[0,-1]];

%%
H = setupXYZ(systemSize, Jx, Jy, Jz);
[Q, E] = eig(H);
E = diag(E);
Dx = simEig( setupD(systemSize, Sx), Q );

[A, B] = collectPM1(Dx, E);

%%
figure('rend','painters','pos',[10 10 200 600]);
plot(-A, B, 'r+');

%%
figure('rend','painters','pos',[10 10 200 600]);
plot(-Dx, E, 'r+');

%%
figure('rend','painters','pos',[10 10 600 600]);
plot(E(1:10), 'r+');