function [ x, fval, iters ] = dfp( f, x0, e)

x = x0;
iters = 0;

n = length(x);
D = eye(n);

while true
    old_x = x;
    [alpha, fval, grad] = compute_alpha(f, x, e);
    
    d = -D * grad;
    x = x + alpha*d;
    [new_fval, new_grad] = f(x);
    
    s = x - old_x;
    r = new_grad - grad;
    
    delta_D = ((s*s') / (s'*r)) - ((D*r*r'*D) / (r'*D*r));
    D = D + delta_D;

    iters = iters+1;
    
    if norm(s) < e
        break;
    end
    if abs(f(x) - f(old_x)) < e
        break;
    end
    if norm(grad) < e
        break;
    end
    if abs(old_x - x) < e
        break;
    end
end

end

function [alpha, fval, grad] = compute_alpha(f, x, e)
%  Also computes direction, and value

[fval, grad] = f(x);
d = -grad;

F = @(a)f(x + a*d);

alpha0 = 0;
delta = 0.1;
max_iter = 1000;
[alpha1, alpha2, alpha3] = alpha_max(F, alpha0, delta, max_iter);

alpha = alpha_newton(F, alpha1, d, e);
%alpha = alpha_parabol(F, [alpha1, alpha2, alpha3], e);

end