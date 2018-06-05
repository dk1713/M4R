function evalues = solveXYZ( H )

M = length(H)/2;

A = H(1:M,1:M);
B = H(1:M,M+1:end);
D = H(M+1:end,M+1:end);
E = setupDx(M); %exchange matrix

e1 = eig(A - B*E);
e2 = eig(D + E*B);

evalues = [e1;e2];
end

