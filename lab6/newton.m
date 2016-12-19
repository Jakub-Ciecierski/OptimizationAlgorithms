function [ x, fval, iters ] = newton( f, x0, e )

iters = 0;
x = x0;

while true
    old_x = x;
    
    [fval, grad, hess] = f(x);
    d = -inv(hess)*grad;
    
    x = x + d;
    
    if abs(old_x - x) < e 
        break;
    end
    iters = iters + 1;
end

end

