function [ a1, a3 ] = alpha_max( F, a1, delta, max_iter)
% Lecture 6 page 27

iteration_count = 0;

a_hat = a1 + delta;

if F(a1) <= F(a_hat)
    a3 = a_hat;
    a2 = (a1 + a3) / 2.0;
    while(condition_3p(F, a1, a2, a3) == -1)
        a2 = (a1 + a2) / 2.0;
        iteration_count = iteration_count + 1;
        if (iteration_count >= max_iter)
            error('Max iteration count reached');
        end
    end
end

if F(a_hat) < F(a1)
    a2 = a_hat;
    a3 = a2 + delta;
    while(condition_3p(F, a1, a2, a3) == -1)
        delta = 2*delta;
        a3 = a2 + delta;
        iteration_count = iteration_count + 1;
        if (iteration_count >= max_iter)
            error('Max iteration count reached');
        end
    end
end

end

function [exit_flag]  = condition_3p(F, a1,a2,a3)
% exit_flag: 1 if condition is matched, -1 otherwise
exit_flag = -1;
if a1 < a2 && a2 < a3 && F(a1) > F(a2) && F(a2) < F(a3)
    exit_flag = 1;
end
end