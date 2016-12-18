function [x, fval, iters ] = gradient_descent(F, x0, e)

x = x0;
iters = 0;

alpha = 0.01;

while true
    old_x = x;

    [fval, d] = F(x);

    x = x - alpha*d;

    if abs(old_x - x) < e
        break;
    end

    iters = iters + 1;
end

end

