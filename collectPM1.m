function [ A, B ] = collectPM1( D, E )

N = sum(abs(D) == 1);
A = zeros(N, 1);
B = zeros(N, 1);

k = 0;
for j = 1:length(D)
    if abs(abs(D(j)) - 1) < 1e-12
        k = k + 1;
        A(k) = D(j);
        B(k) = E(j);
    end
end

end