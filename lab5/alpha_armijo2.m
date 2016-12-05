function [ x ] = alpha_armijo2( F, kappa, p, max_iter)

F0 = F(0);
dF0 = derivative(F,0);

alpha_k  = 1;
k = 0;

kappa = 2;
p = 0.4;

while 1
    F_k = F(alpha_k);
    if F_k > Fp(F0, dF0, alpha_k, p)
        alpha_k = 1/kappa*alpha_k;
        
        if F(alpha_k) <= Fp(F0, dF0, alpha_k,p)
            break;
        end
    end
    k = k + 1;
    if k > max_iter 
        error('Max iterations reached');
    end
end

x = alpha_k;
end


function [x] = Fp (F0, dF0, alpha_k, p)
x = F0 + p*alpha_k*dF0;
end