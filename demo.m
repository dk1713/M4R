N = 8;

kdelta = 2*pi/N;
k = -pi:kdelta:pi - kdelta;

H = setupXY(N, 1, 0, 3);
E = eig(H);

disp(E(1));

sum = 0;

for i = k
    sum = sum + 2*sqrt(10 + 6*cos(i));
end

disp(sum);

disp(2*sqrt(10 + 6*cos(pi)));
disp(E(2)-E(1));

%%

exact = 2*sqrt(10 + 6*cos(pi));
systemSizes = 1:10;
error = zeros(size(systemSizes));

% for i = systemSizes
i = 1;
while 1 < 2
    disp(i);
    H = setupXY(i, 1, 0, 3);
    E = sort(eig(H));
    error(i) = abs(exact - E(2) + E(1));
    disp(E(2)-E(1));
    i = i + 1;
end

plot(systemSizes, log(error));