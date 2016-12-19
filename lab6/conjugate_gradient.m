function [ x, fval, iters ] = conjugate_gradient ( f, x0, e )

iters = 0;
x = x0;

[alpha, fval, d] = compute_alpha(f,x,e);

while true
    old_x = x;
    
    [alpha, fval] = compute_alpha(f,x,e);
    x = x + alpha*d;

    [y, grad] = f(x);
    d = -grad + beta(f, old_x, x)*d;
    
    if abs(old_x - x) < e
        break;
    end
    iters = iters + 1;
end
end

% ------------------------------------------

function [B] = beta(f, x1, x2)
[y1, g1] = f(x1);
[y2, g2] = f(x2);

B = dot(g2,g2) / dot(g1,g1);

end

% ------------------------------------------

function [alpha, fval, d] = compute_alpha(f, x, e)
%  Also computes direction, and value

[fval, d] = f(x);
d = -d;

F = @(a)f(x + a*d);

alpha0 = 0;
delta = 0.1;
max_iter = 1000;
[alpha1, alpha2, alpha3] = alpha_max(F, alpha0, delta, max_iter);

%alpha = alpha_newton(F, alpha1, d, e);
alpha = alpha_parabol(F, [alpha1, alpha2, alpha3], e);

end