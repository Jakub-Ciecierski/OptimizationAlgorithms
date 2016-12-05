function [ d2F ] = derivative2(F, x)
d = 0.001;

x_minus_d = x - d;
if x_minus_d < 0
    x_minus_d = 0;
end

d2F = (F(x + d) - 2*F(x) + F(x_minus_d)) / d^2;

end