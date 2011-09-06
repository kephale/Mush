function float_dup
global floats;
%Push a copy of the top item on the floats stack
if length(floats) >= 1
    float_push( floats(end) );
end