beta = 0.1;

sigma = 0.1;
mu1 = sqrt(sigma)*randn;
mu2 = sqrt(sigma)*randn;
mu3 = sqrt(sigma)*randn;

n = 200;
Y = zeros(2,n+1);
z = zeros(1,n+1);

alpha_1 = [-0.5 1 0.5];
alpha_2 = [0.5 -1 -0.5];
mode = randi(3);

for t = 2:n+1    
    alpha1 = alpha_1(mode);
    alpha2 = alpha_2(mode);
    
    Y(2,t) = Y(1,t-1) + mu1;
    Y(1,t) = alpha1*Y(1,t-1) + alpha2*Y(2,t-1) + mu2;
    z(t) = Y(1,t) + mu3;
    
    redraw = binornd(1,beta);
    mode = mode*(1-redraw) + randi(3)*redraw;
end

t = 1:n+1;
hold on;
plot(t,Y(1,:));
plot(t,Y(2,:));
xlabel('t');
legend('y(1)','y(2)');
hold off;