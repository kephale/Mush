function population=pushgp(popsize, gens, mutation, crossover, elitism, inputs, targets)
% pushgp(popsize, gens, mutation, crossover, elitism, inputs, targets)
% To get started: pushgp(5,1000)
%
% See Jordan Pollack's implementation of Cartesian GP on this symbolic
% regression problem: https://sites.google.com/site/julianfrancismiller/professional

if nargin < 3
    mutation = 0.1;
end

if nargin < 4
    crossover = 0.8;
end

if nargin < 5
    elitism = 1;
end

if nargin < 6
    inputs = rand(1,50) *2 - 1;
end

if nargin < 7
    targets = (inputs.^6 - 2*inputs.^4 + inputs.^2);
end

max_points_in_program = 50;
%functions = {'in()' 'float_plus' 'float_sub' 'float_mult' 'float_div'};
functions = {'in()' 'float_plus' 'float_sub' 'float_mult' 'float_div' 'float_dup' 'float_pop' 'float_swap' 'float_rot'};
    
%setup the initial population
population=cell([1,popsize]);
for i=1:popsize
    population{i}=randindiv(functions,max_points_in_program);
end

output=[];
%The evolutionary loop
for j=1:gens
    
    fitness=zeros(1,popsize);
    parfor i=1:popsize
        fitness(i)=test(inputs,targets,population{i});
    end
    
    fprintf(1,'gen: %d min fitness %d, avg fitness %d\n',j,min(fitness),mean(fitness));
    output=[output,min(fitness)];
    neutral=find(fitness==min(fitness));
    
    best = population{neutral(length(neutral))};
    disp( join( ' ', best ) );
    
    weights = 1 ./ fitness;% Weights for roulette selection
    weights( isnan(weights) ) = 0;% Penalty until the source of NaNs is tracked down
    
    children = population;
    
    if elitism
        start_idx = 2;
        population{1}=best;
    else
        start_idx = 1;
    end
    
    parfor i=start_idx:popsize
        r = rand;
        if r < mutation
            parent_idx = roulette( weights );
            children{i}=mutate(population{parent_idx},functions,max_points_in_program);
        elseif r < mutation + crossover
            parent1_idx = roulette( weights );
            parent2_idx = roulette( weights );
            children{i}=crossover2pt(population{parent1_idx},population{parent2_idx},max_points_in_program);
        else
            children{i}=population{roulette(weights)};
        end
    end
    
    population = children;
    
    if min(fitness)<.01 break;end;
 end
    plot(output);
    xlabel( 'generations' );
    ylabel( 'error' );
        
