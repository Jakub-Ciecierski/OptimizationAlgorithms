clc
clear
format compact

% Fun and Grad
x0 = [3;-1;-1]
d0 = -grad(x0)
F = @(alpha)fun(x0 + alpha*d0);
GradF = @(alpha)grad(x0 + alpha*d0);

% Compute boundary
alpha0 = 0;
delta = 1;
max_iter = 1000;
[alpha0, alpha_max] = alpha_max(F, alpha0, delta, max_iter);

alpha0
alpha_max

% Plot
%fplot(F, [alpha0, alpha_max]);

% fminbnd
epsilon = 0.0001;
options = optimset('fminbnd');
options = optimset(options, 'TolX', epsilon);
alpha_fminbnd = fminbnd(F, alpha0, alpha_max, options);
alpha_fminbnd

alpha_gold = alpha_gold(F, alpha0, alpha_max, epsilon);
alpha_gold

alpha_dichotomy = alpha_dichotomy(F, alpha0, alpha_max, epsilon);
alpha_dichotomy

alpha_fib = alpha_fib(F, alpha0, alpha_max, epsilon);
alpha_fib

alpha_midpoint = alpha_midpoint(F, alpha0, alpha_max, epsilon);
alpha_midpoint

alpha_newton = alpha_newton(F, 0, epsilon);
alpha_newton

kappa = 5;
p = 0.1;
alpha_armijo2 = alpha_armijo2(F, kappa, p, max_iter);
alpha_armijo2