%% Topological Quantum Phase Transition

%% Initialise
Jz = 4;
systemSize = 9;
meshSize = 10;
meshStep = 1;

%% Plot contour of the phase transition.
x = 1:meshStep:meshSize;
y = 1:meshStep:meshSize;% rethink about how I loop these.

[Jx, Jy] = meshgrid(x,y);
gap = zeros(size(Jx));

for yiter = y
    for xiter = x
        H = setupXYZ(systemSize, x(xiter), y(yiter), Jz);
        E = sort(eig(H));
        gap(yiter, xiter) = E(3) - E(2);
    end
    disp(yiter);
end

%%
figure(1);
contour(Jx./Jz, Jy./Jz, gap, 'ShowText', 'on');