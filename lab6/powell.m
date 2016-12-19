function [ x, fval, iters ] = powell( f, x0, e )

max_iters = 100;
iters = 0;
x = x0;
old_x = x;

d1 = [1;0;0];
d2 = [0;1;0];
d3 = [0;0;1];

U = [d1, d2, d3];

while iters < max_iters
    for k = 1:3
        [alpha_k, exitflag]  = compute_alpha(f, old_x, U(:,k), e);
        if exitflag == -1
            U(:,k) = -U(:,k);
            [alpha_k, exitflag]  = compute_alpha(f, old_x, U(:,k), e);
            
            if exitflag == -1
                error('alpha_max reached maxiter twice');
            end
        end
        
        x = old_x + alpha_k*U(:,k);
        old_x = x;      
    
    end
    
    % Find new directions
    for k = 1:2
        U(:,k) = U(:,k+1);
    end
    U(:,3) = (x - x0) / norm(x-x0);
        
    if abs(x - x0) < e
        break;
    end

    alpha_e = compute_alpha(f, x, U(:,3), e);
    x0 = x + alpha_e*U(:,3);
    iters = iters + 1;
end
    fval = f(x);
end



function [alpha, exitflag] = compute_alpha(f, x, d, e)
%  Also computes direction, and value
alpha = -1;

F = @(a)f(x + a*d);

alpha0 = 0;
delta = 0.1;
max_iter = 1000;
[alpha1, alpha2, alpha3, exitflag] = alpha_max(F, alpha0, delta, max_iter);
if exitflag == -1
    return;
end

%alpha = alpha_newton(F, alpha1, d, e);
alpha = alpha_parabol(F, [alpha1, alpha2, alpha3], e);

end