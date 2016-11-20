clc
clear
format compact

% --------------------------------------- %
% ------------ OPTIMIZATION ------------- %
% --------------------------------------- %


% Set up funtion parameters. Omega
f = [3; 2; 0; 0; 0];
A = [2, 1, 1, 0, 0;
     3, 3, 0, 1, 0;
     1.5, 0, 0, 0, 1];
b = [10; 24; 6];

[x, fval, exitflag] = simplex(f, A, b);

x
fval
exitflag