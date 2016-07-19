figure(1);
hold on;
cc = zeros(5,3);
for k = 1:5
    cc(k,1:3)=rand(1,3);
end

[m,n] = size(component);

for j=1:m
    scatter(pos(j,1),pos(j,2),30,cc(component(j)));
    drawnow;
end   
hold off;