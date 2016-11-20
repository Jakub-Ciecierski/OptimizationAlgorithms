clc
clear
format compact

M = 1000;
f = [-5; 0; -2; -2; 3;   0; 0; 0;   -M; -M; -M];
A = [0, -2, -2, -6, 2,  -1, 0 ,0,   1, 0, 0;
     -4, 7, -7, 0, 6,  0, -1, 0,   0 , 1, 0;
     -4, 4, -6, 1, 5,  0, 0, 1,   0, 0, 1];
b = [5; 2; 1];

[x, fval, exitflag] = simplex(f, A, b);

x
fval
% exitFlag = 1 if successfull
exitflag