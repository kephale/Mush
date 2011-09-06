function sum=test(inputs,targets,prog)
% Fitness is the sum of absolute value of difference between
% function and phenotype on length(inputs) values 
% Note: This contains hard-coded bounds on the outputs of the input program

sum=0.0;
for j=1:length(inputs)
    
    input = inputs(j);
    target = targets(j);
    
    % The input variable can be accessed 2 ways, as the only item on the
    % initial stack, or via the anonymous function 'in'
    
    in = @() (float_push(input));
    clear global floats;
    global floats;
    floats = [input]; % <--- float stack

    for i=1:length(prog)
        eval (prog{i});
    end
    
    if isempty(floats)
        sum = sum + 10E10;% if we don;t have an output then give a heavy penalty
    else
        output = floats(end);
        sum = sum + abs( min(max(output,-10E10),10E10) - target );
    end
    
    
end
