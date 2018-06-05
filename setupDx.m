function D = setupDx( N ) % anti identity

D = zeros(N,N);

for i = 1:N
    for j = 1:N
        if (i + j == N + 1)
            D(i,j) = 1;
        end
    end
end

end