function z=randindiv(functions,max_points_in_program)
% Given a cell array of function names and maximum number of points in a
% program, make a random individual.
% Note: currently does not create nested expressions

z = {};

num_functions = length(functions);
program_length = randi( max_points_in_program );

for i=1:program_length
    z=[z,functions( randi( num_functions ) )];
end
