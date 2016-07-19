function output = func(i,j,h)
if ((i >= -h && i <= h) && (j >= -h && j <= h))
    output = 1;
else
    output = 0;
end