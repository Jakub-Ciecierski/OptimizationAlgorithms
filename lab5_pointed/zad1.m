clc
clear
format compact

% Fun and Grad
x0 = [3;-1;-1];
[y,d0,H] = fun(x0);
d0 = -d0;

y
d0
H

% fminbnd
F = @(alpha)fun(x0 + alpha*d0);

% Compute boundary
alpha0 = 0;
delta = 0.1;
max_iter = 1000;
[alpha1, alpha2, alpha3] = alpha_max(F, alpha0, delta, max_iter);


% Plot
%fplot(F, [alpha0, alpha_max]);

% fminbnd
epsilon = 0.0001;
options = optimset('fminbnd');
options = optimset(options, 'TolX', epsilon, 'Display', 'iter');
alpha_fminbnd = fminbnd(F, alpha1, alpha3, options);
alpha_fminbnd

% alpha_netwon
alpha_newton = alpha_newton(F, alpha1, d0, epsilon);
alpha_newton

% alpha_parabol
alphas = [alpha1, alpha2, alpha3];
alpha_parabol = alpha_parabol(F, alphas, epsilon);
alpha_parabol