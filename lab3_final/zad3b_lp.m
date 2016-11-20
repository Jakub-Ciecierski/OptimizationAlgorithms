clc
clear
format compact

% Set up options
options = optimset('linprog');
options = optimset(options, ...
                    'LargeScale', 'off', ...
                    'Simplex', 'on', ...
                    'Display', 'iter');
                    

f = [-5; 0; -2; -2; 3];
A = [0, 2, 2, 6, -2;
     4, -7, 7, 0, -6;
     -4, 4, -6, 1, 5];
b = [-5; -2; 1];
lb = [0; 0; 0; 0; 0];
ub = [inf; inf; inf; inf; inf];
[x, f_val, exitFlag, output, lambda] = ...
                linprog(-f, A, b, [], [], lb, ub, [], options);
f_val = -f_val;
z = f'*x;

% 27.2

x
z
f_val
% exitFlag = 1 if successfull
exitFlag
output
lambda