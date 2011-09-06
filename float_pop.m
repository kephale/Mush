function float_pop
% Pop the first item on the floats stack
global floats;
if ~isempty(floats)
    floats = floats(1:end-1);
end