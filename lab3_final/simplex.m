function [ x, fval, exitflag ] = simplex( f, A, b)
% Assume Ax = b;
% exitflag == 1 if there exists a solution
% exitflag == -3 unlimitted
% exitflag == -2  no feasible point

[A, c, z, z_c, base_indices] = init(A, b, f);

iter = 0;
while 1
    print_table(c, A, z, z_c, base_indices)

    % Ending critera
    if( ending_criteria(z_c) == 1)
        exitflag = 1;
        break;
    end
    
    % Find new base variable
    new_base_i = smallest_element_index(z_c);
    remove_base_i = remove_base_index(base_indices, new_base_i, A);
    if remove_base_i == -1
        exitflag = -3; % unlimitted
        
        if (check_fake_basis(A, f, base_indices) == 0)
            exitflag = -3;
            break;
        end
        if (check_fake_basis(A, f, base_indices) ~= -1)
            exitflag = -2;
            break;
        end
        break;
    end
    
    [base_c_values, base_indices] = change_base(c, base_indices, remove_base_i, new_base_i);
    A = row_reduce(A, base_indices, new_base_i);  
    [z, z_c] = update_z_c(base_c_values, A, c);
    
    iter = iter + 1;
end

[x, fval] = get_solution_variables(A, f, base_indices);

% Check fake basis
if (check_fake_basis(A, f, base_indices) == -1)
   exitflag = -2;
end

iter

end % simplex

% -----------------------------------------

function [A, c, z, z_c, base_indices] = init(A, b, f)
[n,m] = size(A);

c = f;
z = zeros(length(f),1);
z_c = z - c;

% Choose initial base
% Hard-coded n last variables
base_indices = [m-n+1:m];
A = [A,b];

end

% -----------------------------------------

function [exitflag] = check_fake_basis(A, f, base_indices)
[x, fval] = get_solution_variables(A, f, base_indices);
[n,m] = size(A);
exitflag = 0;

for i=m-n:m-1
    disp(i)
    if x(i) ~= 0
        exitflag = -1;
        break;
    end
end
end

% -----------------------------------------

function [is_done] = ending_criteria(z_c)
% is_done = 1 is algoritm should stop, 0 otherwise

is_done = 0;
s = sum(z_c >= 0);
if s == length(z_c)
    is_done = 1;
end

end % ending_criteria

% --------------------------------------------

function [i_smallest] = smallest_element_index(z_c)
    [y,i] = min(z_c);
    i_smallest = i;
end % smallest_element_index

% --------------------------------------------

function [index] = remove_base_index(base_indices, new_base_i, A)
% i == -1 if all values are negative
column = A(:, new_base_i);

% Replace all negative/zeros with inf
for i = 1:length(column)
    if column(i) < 0
        column(i) = 0;
    end
end

b = get_b(A);

divided = b ./ column;
% ommit inf
[y,index] = min(divided);
if y  == inf
    index = -1; % unbound
    return 
end

index = base_indices(index);

end % remove_base_index

% --------------------------------------------

function [base_c_values, base_indices] = change_base(c, base_indices, remove_index, new_index)
index = find(base_indices == remove_index);
base_indices(index) = new_index;

base_c_values = zeros(length(base_indices),1);
for i=1:length(base_indices)
    base_c_values(i) = c(base_indices(i));
end

end % change_base

% --------------------------------------------

function [A] = row_reduce(A, base_indices, new_base_index)
% Get value 1 in place of new base variable
row_index_of_new_base = find(base_indices == new_base_index);
row = A(row_index_of_new_base,:);
row = row ./ row(new_base_index);
A(row_index_of_new_base,:) = row;

% Get value 0 everywhere else in the column
[rows,m] = size(A);
for i = 1:rows
    if i == row_index_of_new_base
        continue
    end
    value_to_zero = A(i, new_base_index);
    A(i,:) = A(i,:) - (value_to_zero*A(row_index_of_new_base, :));
end

end % row_reduce

% --------------------------------------------

function [z, z_c] = update_z_c(base_c_values, A, c)
[rows, columns] = size(A);
for i=1:columns-1 % dont include b
    z(i,1) = dot(A(:,i), base_c_values);
end

z_c = z - c;

end % update_z_c

% --------------------------------------------

function [b] = get_b(A)
[n,m] = size(A);
b = A(:,m);
end

% --------------------------------------------

function [x, fval] = get_solution_variables(A, f, base_indices)
b = get_b(A);
x = zeros(length(f),1);
current_b_index = 1;
for i = 1:length(x)
    if ~isnan(find(base_indices == i))
        x(base_indices(current_b_index),1) = b(current_b_index);
        current_b_index = current_b_index + 1;
    end
end

fval = f' * x;
end

% --------------------------------------------

function [] = print_table(c, A, z, z_c, base_indices)
% Prints the current status of the table
% |    c      |
% --------------
% |           | |
% |     A     |b|
% |           | |
% --------------
% |     z     |
% |    z-c    |
% 
%
% |    base   |

disp(c')
disp(char('----------------------------------------------------------'))
disp(A)
disp(char('----------------------------------------------------------'))
disp(z')
disp(z_c')


disp(char('Base indices:'));
disp(base_indices);

disp(char('----------------------------------------------------------'))
disp(char(' '))
disp(char(' '))
disp(char(' '))
end