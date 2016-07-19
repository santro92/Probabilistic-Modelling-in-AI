A = zeros(21,21);

for i = -10:10
    for j = -10:10
        temp = zeros(1,10);
        for h = 1:10
            if (func(i,j,h))
                temp(1,h) = 1;
            else
                temp(1,h) = 0;
            end
        end
        A(i+11,j+11) = sum(temp);
    end
end