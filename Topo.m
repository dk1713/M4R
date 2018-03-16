%% Topological Quantum Phase Transition

%% Initialise
Jz = 4;
systemSize = 8;
meshStep = 0.1;
maxJ = 9;

%% Plot contour of the phase transition.
x = 0:meshStep:maxJ;
y = 0:meshStep:maxJ;

loopSize = length(x);

[Jx, Jy] = meshgrid(x,y);
gap = zeros(size(Jx));

for xiter = 1:loopSize
    disp('^^^^^^^^^^^^^^^^^^^^^^^^^');
    for yiter = 1:length(y)
        H = setupXYZ(systemSize, x(yiter), y(xiter), Jz);
        E = sort(eig(H));
        gap(xiter, yiter) = E(3) - E(2);
    end
    disp([num2str(xiter), '/', num2str(loopSize), 'th row DONE']);
end

%%
figure('rend','painters','pos',[10 10 600 600]);
contour(Jx./Jz, Jy./Jz, gap, 10, 'ShowText', 'on');

hold on;
plot(1, 1, 'rx');