clc
clear
format compact

% Fun and Grad

x0 = [0.2;0.1;0.6];
[y,d0,H] = fun(x0);
d0 = -d0;

disp('Function info: ')
y
d0
H
disp('-----------------------')

e = 0.0001;
f = @fun;

%options = optimoptions('fminunc', 'StepTolerance', e, 'SpecifyObjectiveGradient',true, 'HessianFcn', 'objective');
%options = optimoptions('fminunc', 'StepTolerance', e, 'SpecifyObjectiveGradient',true);
options = optimoptions('fminunc', 'StepTolerance', e, 'SpecifyObjectiveGradient',true, 'HessianFcn', []);                    

disp('fminunc:')
[x, fval, exitflag] = fminunc(f, x0, options)
disp('-----------------------')

disp('fminsearch:')
[x, fval, exitflag] = fminsearch(f, x0)
disp('-----------------------')

disp('gradient_descent:')
[x, fval, iters] = gradient_descent(f, x0, e)
disp('-----------------------')


disp('steepest_descent:')
[x, fval, iters] = steepest_descent(f, x0, e)
disp('-----------------------')

disp('conjugate_gradient:')
[x, fval, iters] = conjugate_gradient(f, x0, e)
disp('-----------------------')

disp('newton:')
[x, fval, iters] = newton(f, x0, e)
disp('-----------------------')