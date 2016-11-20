clc
clear
format compact

% Set up options
options = optimset('linprog');
options = optimset(options, ...
                    'LargeScale', 'off', ...
                    'Simplex', 'on', ...
                    'Display', 'iter');
                    

f = [5; -3; 2; -2; 7];
A = [-6, -6, 3, -2, -5;
     -3, 0, -5, 0, 6;
     4, 4, 0, 1, 2];
b = [-5; 1; -6];
lb = [0; 0; 0; 0; 0];
ub = [inf; inf; inf; inf; inf];
[x, f_val, exitFlag, output, lambda] = ...
                linprog(-f, A, b, [], [], lb, ub, [], options);
f_val = -f_val;
%z = f'*x;

% 27.2

x
%z
f_val
% exitFlag = 1 if successfull
exitFlag
output
lambda