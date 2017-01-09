clc
clear
format compact

range = [-5,5];

n = 10;
m = 5;

% --- <D> -----

d = range(1) + (range(2)-range(1)).*rand(n,1);
d = floor(d);
t = triu(bsxfun(@min,d,d.').*rand(n),1);
t = floor(t);
D = diag(d)+t+t.';

% --- </D> -----

c = randi(range,n,1);
A = randi(range,m,n);
b = randi(range,m,1);

c
A
b
D = (D*D')/2

% --- <quadprog> -----

[x, fval, exitflag] = quadprog(D, c, [],[], A, b);

x
fval
exitflag

% --- </quadprog> -----