function [ y, grad, hess ] = fun( x )

y = (x(1) + 2*x(2))^4 + (3*x(2) + x(3))^2 + (2*x(1) + 4*x(3))^2;

grad = [
    4 * (x(1) + 2*x(2))^3 + 4 * (2*x(1) + 4*x(3));
    8 * (x(1) + 2*x(2))^3 + 6 * (3*x(2) + x(3));
    2 * (3*x(2) + x(3)) + 8 * (2*x(1) + 4*x(3))
    ];

hess = [
    12*(x(1) + 2*x(2))^2 + 8    , 24*(x(1) + 2*x(2))^2          , 8;
    24*(x(1) + 2*x(2))^2        , 48 * (x(1) + 2*x(2))^2 + 36   , 6;
    16                          , 6                             , 34
    ];

end

