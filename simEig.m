function ev = simEig( M, Q )

N = length(M);
ev = zeros(N, 1);

for k = 1:N
    evector = Q(:,k);
    ev(k) = evector'*M*evector;
end

end