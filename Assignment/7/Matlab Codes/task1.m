ALPHA = 0.5;
N = 500;
x = 1:N;
y = ALPHA ./ ((x - 1) + ALPHA);
plot(x,y)