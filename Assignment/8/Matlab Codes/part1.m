function Y= part1

x1 = -10:0.1:10;
x2 = x1;
Y = [];
for i = 1:length(x1)
    temp = [];
    for j = 1:length(x2)
        temp = [temp, plotEV([x1(i),x2(j)])];
    end
    Y = [Y; temp];
end
mesh(x1,x2,Y);

function [Y] = plotEV(X)

R = sqrt(X(1).^2 + X(2).^2) + eps;
Y = 5*sin(R)./R + 0.2*randn;

