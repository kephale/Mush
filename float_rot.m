function float_rot
% Rotate the top three items on the floats stack
global floats;
if length(floats) >= 3
    a = floats(end);
    b = floats(end-1);
    c = floats(end-2);
    float_pop; float_pop; float_pop;
    float_push( b );
    float_push( a );    
    float_push( c );
end