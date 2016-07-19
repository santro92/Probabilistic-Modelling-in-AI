sigma = 0.1;
alpha1 = -0.5;
alpha2 = 0.5;
mu1 = sqrt(sigma)*randn;
mu2 = sqrt(sigma)*randn;
mu3 = sqrt(sigma)*randn;

n = 5;
Y = zeros(2,n);
z = zeros(1,n);

for t = 2:n
    Y(2,t) = Y(1,t-1) + mu1;
    Y(1,t) = alpha1*Y(1,t-1) + alpha2*Y(2,t-1) + mu2;
    z(t) = Y(1,t) + mu3;
end

t = 1:n;
figure;
hold on;
plot(t,Y(1,:));
plot(t,Y(2,:));
xlabel('t');
legend('y(1)','y(2)');
hold off;