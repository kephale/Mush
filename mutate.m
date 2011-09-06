function z=mutate(x,functions,max_points_in_program)
z=x;

% mutate by headless chicken crossover

w = randindiv(functions,max_points_in_program);

while isequal( z,x )
    z = crossover2pt(z,w,max_points_in_program);
end
