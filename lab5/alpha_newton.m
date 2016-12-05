function [ x ] = alpha_newton(F, a, epsilon)
% Doesn't give good results.

x = a - (derivative(F, a) / derivative2(F, a));

while true
    x_last = x;
    x = x - (derivative(F, x) / derivative2(F, x));
    
    if abs(x - x_last) < epsilon || abs(derivative(F, x_last)) < epsilon
        break;
    end
end

end

