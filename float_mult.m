function float_mult
global floats;
%Multiply the last two items on the floats stack
if length(floats) >= 2
    a = floats(end);
    b = floats(end-1);
    float_pop; float_pop;
    float_push( a * b );
end