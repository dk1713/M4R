function evalues = solveXXZ( N, H )

S = diag(setupSz(N));          %Total Spin

isEven = false;
if mod(N, 2) == 0
    isEven = true;
end

if isEven
    lowS = 0;
else
    lowS = 1;
end

spin = lowS:2:S(1)-2;
evalues = [H(1,1); H(end,end)];

for j = spin
    if j == 0
        index = find(S == 0);
        E0 = solveXYZ(H(index, index));
    else 
        index = find(S == j);
        H1 = H(index, index);
        E1 = eig(H1);
        evalues = [evalues; E1];
    end
end

evalues = [evalues; evalues];
if mod(N, 2) == 0
    evalues = [E0; evalues];
end

end

