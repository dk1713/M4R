% flop plots
k = 0:0.2:5;
plot(k, 32*k.^3/3, k, 8*k.^3/3 + 6*k.^2);
title('Efficiency of the diagonalisation with reduction');
ylabel('flops');
xlabel('k');
legend('without','with');