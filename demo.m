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
systemSizes = 1:11;
error = zeros(size(systemSizes));

for i = systemSizes
% i = 1;
% while 1 < 2
    disp(i);
    H = setupXY(i, 1, 0, 3);
    E = sort(eig(H));
    error(i) = abs(exact - E(2) + E(1));
    disp(E(2)-E(1));
%     i = i + 1;
end
%%
figure(1);
plot(systemSizes, log(error));
title('N against Log(error)');

figure(2);
plot(log(systemSizes), log(error));
title('log(N) against Log(error)');

coeff1 = polyfit(log(systemSizes(3:end)), log(error(3:end)),1);
coeff2 = polyfit(log(systemSizes(3:end)), log(error(3:end)),2);