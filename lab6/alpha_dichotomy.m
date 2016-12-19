function [ x ] = alpha_dichotomy( F, a, b, epsilon )

% 1)
epsilon2 = 2 * epsilon;
k = 1;
a_k = a;
b_k = b;
xm_k = (a_k + b_k) / 2;
delta_k = abs(b_k - a_k);

% 6)
while delta_k > epsilon2

    % 2)
    x1_k = a_k + delta_k / 4;
    x2_k = b_k - delta_k / 4;

    % 3)
    if F(x1_k) < F(xm_k)
        b_k = xm_k;
        a_k = a_k;
        xm_k = x1_k;
    % 4)
    elseif (F(x2_k) < F(xm_k))
        a_k = xm_k;
        b_k = b_k;
        xm_k = x2_k;
    % 5)
    else
        a_k = x1_k;
        b_k = x2_k;
    end
    delta_k = abs(b_k - a_k);
    k = k+1;
end

x = xm_k;

end

