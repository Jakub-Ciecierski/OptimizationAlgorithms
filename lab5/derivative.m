function [ dF ] = derivative(F, x)
d = 0.001;
x_minus_d = x - d;
if x_minus_d < 0
    x_minus_d = 0;
end

dF = (F(x + d) - F(x_minus_d)) / 2*d;

end

