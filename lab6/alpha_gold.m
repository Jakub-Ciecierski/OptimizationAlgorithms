function [ x ] = alpha_gold(F, a, b, epsilon)

c = (sqrt(5) - 1) / 2;

k = 1;
a_k = a;
b_k = b;
delta_k = b_k - a_k;

% 1)
x1_k = b_k - c*(b_k - a_k);
x2_k = a_k + c*(b_k - a_k);

Fx1 = F(x1_k);
Fx2 = F(x2_k);

% 2)
while delta_k > epsilon
   
    % 3)
    if (F(x2_k) > F(x1_k))
        %a_k = a_k;
        b_k = x2_k;
        x2_k = x1_k;
        x1_k = b_k - c*(b_k - a_k);
    
    elseif (F(x2_k) <= F(x1_k))
        a_k = x1_k;
        %b_k = b_k;
        x1_k = x2_k;
        x2_k = a_k + c*(b_k - a_k);
    end
    
    
    k = k + 1;
    delta_k = abs(b_k - a_k);
end

x = (a_k + b_k) / 2;

end

