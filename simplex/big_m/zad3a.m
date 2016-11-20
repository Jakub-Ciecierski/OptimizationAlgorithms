clc
clear
format compact

% Add "dopelniajace" to eliminate inquality
% Multiply by -1 to eliminate negative b values
% Add "sztuczne" as new bases 
% and add corresponding -M in the goal function
M = 1000;
f = [5; -3; 2; -2; 7;      0; 0; 0;     -M; -M; -M];
A = [6, 6, -3, 2, 5,       -1, 0 ,0,    1, 0, 0;
     -3, 0, -5, 0, 6,      0, 1, 0,     0 , 1, 0;
     -4, -4, 0, -1, -2,    0, 0, -1,    0, 0, 1];
b = [5; 1; 6];

[x, fval, exitflag] = simplex(f, A, b);

x
fval
% exitFlag = 1 if successfull
exitflag