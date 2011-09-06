function float_sub
global floats;
%Subtract the last item on the floats stack from the 2nd to last
if length(floats) >= 2
    a = floats(end);
    b = floats(end-1);
    float_pop; float_pop;
    float_push( b - a );
end