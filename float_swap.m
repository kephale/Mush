function float_swap
% Swap the top two items on the floats stack
global floats;
if length(floats) >= 2
    a = floats(end);
    b = floats(end-1);
    float_pop; float_pop;
    float_push( a );    
    float_push( b );
end