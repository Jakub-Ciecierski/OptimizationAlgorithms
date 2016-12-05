function [ alpha_opt, n_iter ] = alpha_parabol(F, alphas, epsilon )

alpha_opt = 0;
n_iter = 0;
max_iter = 2000;

%while abs(alphas(3) - alphas(1)) < epsilon
while true
    F1 = F(alphas(1));
    F2 = F(alphas(2));
    F3 = F(alphas(3));

    a1 = (alphas(2)^2 - alphas(3)^2) * F1;
    a2 = (alphas(3)^2 - alphas(1)^2) * F2;
    a3 = (alphas(1)^2 - alphas(2)^2) * F3;

    b1 = (alphas(2) - alphas(3)) * F1;
    b2 = (alphas(3) - alphas(1)) * F2;
    b3 = (alphas(1) - alphas(2)) * F3;
    alpha_opt = 0.5 * ((a1+a2+a3) / (b1+b2+b3) );
       
    if abs(alphas(2) - alpha_opt) < epsilon
        break;
    elseif alphas(1) < alpha_opt && alpha_opt < alphas(2) && alphas(2) < alphas(3)
        if F(alpha_opt) > F(alphas(2))
            a1 = alphas(1);
            a2 = alphas(2);
            a3 = alphas(3);

            alphas(1) = alpha_opt;
        elseif F(alpha_opt) <= F(alphas(2))
            a1 = alphas(1);
            a2 = alphas(2);
            a3 = alphas(3);

            alphas(2) = alpha_opt;
            alphas(3) = a2;
        end
    elseif alphas(1) < alphas(2) && alphas(2) < alpha_opt && alpha_opt < alphas(3)
        if F(alpha_opt) > F(alphas(2))
            a1 = alphas(1);
            a2 = alphas(2);
            a3 = alphas(3);

            alphas(3) = alpha_opt;
        elseif F(alpha_opt) <= F(alphas(2))
            a1 = alphas(1);
            a2 = alphas(2);
            a3 = alphas(3);

            alphas(1) = a2;
            alphas(2) = alpha_opt;
        end
    end
	n_iter = n_iter + 1;
    if n_iter > max_iter
        break;
    end
end 
n_iter
end

