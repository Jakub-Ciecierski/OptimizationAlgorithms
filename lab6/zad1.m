 clc
clear
format compact

% Fun and Grad

interval = [-10, 10];
r1 = interval(1) + (interval(2)-interval(1)).*rand();
r2 = interval(1) + (interval(2)-interval(1)).*rand();
r3 = interval(1) + (interval(2)-interval(1)).*rand();
x0 = [r1;r2;r3];
[y,d0,H] = fun(x0);
d0 = -d0;

disp('Function info: ')
x0
y
d0
H
disp('-----------------------')

e = 0.001;
f = @fun;

options = optimset('GradObj', 'on');

disp('fminunc:')
[x, fval, exitflag] = fminunc(f, x0, options)
disp('-----------------------')

disp('fminsearch:')
[x, fval, exitflag] = fminsearch(f, x0)
disp('-----------------------')

disp('powell:')
[x, fval, iters] = powell(f, x0, e)
disp('-----------------------')


disp('dfp:')
[x, fval, iters] = dfp(f, x0, e)
disp('-----------------------')