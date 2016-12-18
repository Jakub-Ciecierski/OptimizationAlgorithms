function [ x ] = alpha_fib( F, a, b, epsilon )

Fib=[0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610, 987, 1597, 2584, 4181];
N = length(Fib);

c = Fib(N-1) / Fib(N);

k = 0;
a_k = a;
b_k = b;
delta_k = b_k - a_k;

% 1)
x1_k = b_k - c*(b_k - a_k);
x2_k = a_k + c*(b_k - a_k);

% 2)
while k < N - 3 && delta_k > epsilon
    c = Fib(N-1-k) / Fib(N-k);   
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

