function float_div
global floats;
%Divide the last item on the floats stack by the 2nd to last
if length(floats) >= 2
    a = floats(end);
    b = floats(end-1);
    float_pop; float_pop;
    float_push( a / b );
end