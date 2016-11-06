clc
clear
format compact

% --------------------------------------- %
% ------------ OPTIMIZATION ------------- %
% --------------------------------------- %


% Set up funtion parameters. Omega
f = [-1; 1; 3; 0; 0; 0];
A = [-4, 2, -1, 1, 0, 0;
     2, -1, 1, 0, 1, 0;
     3, 0, 1, 0, 0, 1];
b = [2; 1; 5];

[x, fval, exitflag] = simplex(f, A, b);

x
fval
exitflag