% --------------------------------------- %
% --------------- INIT ------------------ %
% --------------------------------------- %

f = [-4; 1; 2];
A = [-3, 1, -7;
     -1, 2, 0;
     -2, -1, 5];
b = [2; 5; 2];
lb = [0;0;0];
ub = [inf, inf, inf];
[x, exitflag] = simplex(f, A, b, lb);

[n,m] = size(A);
% Set up options
options = optimset('linprog');
options = optimset(options, ...
                    'LargeScale', 'off', ...
                    'Display', 'iter');
                    
% Compute
[x, f_val, exitFlag, output, lambda] = ...
                linprog(f, A, b, [], [], lb, ub, [], options);

z = f'*x;

x
z
f_val
% exitFlag = 1 if successfull
exitFlag
output
lambda
