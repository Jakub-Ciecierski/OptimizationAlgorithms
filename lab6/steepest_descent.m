function [ x, fval,  iters ] = steepest_descent( f, x0, e)

iters = 0;
x = x0;

while true
    old_x = x;
    [alpha, fval, d] = compute_alpha(f,x,e);
    
    x = x + alpha*d;
    
	if abs(old_x - x) < e
        break;
    end
    
    iters = iters + 1;
end

end

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
