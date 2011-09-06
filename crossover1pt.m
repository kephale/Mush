function z=crossover1pt(a, b, max_points_in_program)

pa = randi( length(a) );
pb = randi( length(b) );

if rand<0.5
    z = [a(1:pa) b(pb:end)];
else
    z = [b(1:pb) a(pa:end)];
end

if length(z) > max_points_in_program
    z = a;
end
