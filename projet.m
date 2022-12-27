  %init
t0 = 0;
tfinal = 100;
% Individus
N = 1;
% Individus infectés
I0 = 0.5;
% Individus susceptibles d'être infectés
S0 = 0.5;
% personne retirées
R0 = 0;
% Taux de contact
B = 0.8;
%Taux de guérison
alpha = 0.03;
% Taux de naissance / Décès
d = 0.02;

r0 = B/(d+alpha)


syms S(t) I(t) R(t)
eqns = [diff(S,t) == -B*S*I, diff(I,t) == B*S*I-(d+alpha)*I, diff(R,t) == (d+alpha)*I];
init = [I0, S0, R0];
V = odeToVectorField(eqns, init);
M = matlabFunction(V,'vars',{'t','Y'});
interval = [t0 tfinal];
ySol = ode89(M,interval,init);

tValues = linspace(t0,tfinal,200);
yValues = deval(ySol,tValues);
plot(tValues,yValues)
legend('Infectés','Saines','Retirées')
