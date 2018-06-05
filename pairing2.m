%% Topological pairing

%% Initialise
Jz = 0.5;
J = 1;
Sz = 0;
systemSize = 10;

[A, B] = solveXXZ2(systemSize, J, Jz, Sz);

%%
figure('rend','painters','pos',[10 10 200 600]);
plot(-A, B, 'r+');