%% 
N = 2;

H2 = setupHam(N, 1, false);
[Q2, D2] = eig(H2);

%%
N = 3;

H3 = setupHam(N, 1, true);
[Q3, D3] = eig(H3);

%%
N = 10;

H10 = setupHam(N, 1, true);
[Q10, D10] = eig(H10);