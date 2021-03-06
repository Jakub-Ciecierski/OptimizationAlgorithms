% --------------------------------------- %
% --------------- INIT ------------------ %
% --------------------------------------- %

clc
clear
format compact

% --------------------------------------- %
% ------------ OPTIMIZATION ------------- %
% --------------------------------------- %

% Set up funtion parameters. Omega
f = [1; 1; 1];
A = [2, 1, 0;
     1, 4, 6];

b = [21; 14];
lb = [0;0;0];
%ub = [inf; 0];

% Set up options
options = optimset('linprog');
options = optimset(options, ...
                    'LargeScale', 'off', ...
                    'Simplex', 'on', ...
                    'Display', 'iter');
                    
% Compute
[x, f_val, exitFlag, output, lambda] = ...
                linprog(f, -A, -b, [], [], lb, [], [], options);

z = f'*x;

x
z
f_val
% exitFlag = 1 if successfull
exitFlag
output
lambda


% --------------------------------------- %
% -------------- Drawing ---------------- %
% --------------------------------------- %

% hold on;
% grid on;
% 
% x1 = -2: 0.1: 2;
% x2 = x1;
% 
% axis([-2 2 -2 2]);
% [X1 X2] = meshgrid(x1, x2);
% 
% F = f(1) .* X1 + f(2) .* X2;
% [C,h] = contour(X1, X2, F, 'r-');
% 
% clabel(C,h);
% 
% for i = 1 : 4;
%     G = A(i,1) .* X1 + A(i,2) .* X2 - b(i);
%     % Internal lines
%     contour(X1, X2, G,0:-0.1:-0.5, 'g-');
%     
%     contour(X1, X2, G,[0,0], 'b-');
%     % Input a point with a mouse click
%     %gtext(sprintf('g%d', i));
% end
% 
% x_opt = [A(1,:) ; A(3,:)] \ [b(1); b(3)];
% f_opt = f' * x_opt;
% 
% x_opt
% f_opt