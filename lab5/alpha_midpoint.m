function [ x ] = alpha_midpoint( F, a, b, epsilon )

a_k = a;
b_k = b;
k = 1;

while abs(b_k - a_k) > epsilon
    z_k = (a_k + b_k) / 2;
    
    dF_k = derivative(F, z_k);
    
    if(abs(dF_k) < epsilon)
        break;
    end

    % 2)
    if dF_k > 0
        b_k = z_k;
    % 3)
    elseif dF_k < 0
        a_k = z_k;
    end
end

x = (a_k + b_k) / 2;

end