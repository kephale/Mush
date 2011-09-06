function z=crossover2pt(a, b, max_points_in_program)

p1a = randi( length(a) );
p2a = randi( [p1a length(a)] );

p1b = randi( length(b) );
p2b = randi( [p1b length(b)] );

if rand<0.5
    z = [a(1:p1a) b(p1b:p2b) a(p2a:end)];
else
    z = [b(1:p1b) a(p1a:p2a) b(p2b:end)];
end

if length(z) > max_points_in_program
    z = a;
end
