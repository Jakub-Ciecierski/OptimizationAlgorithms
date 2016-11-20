clc
clear
format compact

% --------------------------------------- %
% ------------ OPTIMIZATION ------------- %
% --------------------------------------- %


% Set up funtion parameters. Omega
f = [-4; 1; 2; 0; 0; 0];
A = [-3, 1, -7, 1, 0, 0;
     -1, 2, 0, 0, 1, 0;
     -2, -1, 5, 0, 0, 1];
b = [2; 5; 2];
lb = [0;0;0];
[x, fval, exitflag] = simplex(f, A, b);

x
fval
exitflag

