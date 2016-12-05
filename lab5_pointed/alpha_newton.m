function [ x ] = alpha_newton(F, a, d0, epsilon)

n_iter = 1;
x = a - (dF(F, a, d0) / ddF(F, a, d0));

while true
    x_last = x;
    x = x - (dF(F, x, d0) / ddF(F, x, d0));
    
    if abs(x - x_last) < epsilon || abs(dF(F, x_last, d0)) < epsilon
        break;
    end
    n_iter = n_iter+1;
    
end
n_iter
end

function [dF] = dF(F, x, dk)

[y,grad] = F(x);
dF = dot(grad,dk);

end

function [ddF] = ddF(F, x, dk)

[y, grad, hess] = F(x);

b = hess * dk;
ddF = dot(dk,b);

end