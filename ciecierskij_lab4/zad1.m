clc
clear
format compact

% Set up options
options = optimset('linprog');
options = optimset(options, ...
                    'LargeScale', 'off', ...
                    'Simplex', 'on', ...
                    'Display', 'iter');
                    

f = [-4; 1; -2;];
A = [-3, 1, -7;
     1, -2, 4;
     -2, 1, 5];
b = [-10; 5; 2];
A = -A;
b = -b;
g = [5;10;30];
lb = -g;
[x, f_val, exitFlag, output, lambda] = ...
                linprog(f, A, b, [], [], lb, [], [], options);
%x=-x;
z = f'*x;

% -6.7

x
z
f_val
% exitFlag = 1 if successfull
exitFlag
output
lambda