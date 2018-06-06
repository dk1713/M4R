%% Ground State energy for XY chain

error = zeros(1,8);

for n = 3:11
    H = setupXYZ(n, 3, -1, 0);
    E = solveXYZ(H);
    
end

%%
N = 8;
h = 0;
g = 1.5;
H = setupXYZ(N, (1 + g)/4, (1 - g)/4, 0) + h*setupSz(N);
E = solveXYZ(H);
E = sort(E);
E1 = E(1);

E0 = 0;
for q = 0:N-1
    b = 2*pi*(q + 0.5)/N;
    E0 = E0 + sqrt(cos(b)^2 +g^2*sin(b)^2);
end

E0 = -0.5*E0;