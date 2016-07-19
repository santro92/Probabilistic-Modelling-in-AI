clc;
K = 3; %No of arms
theta = [0.50 0.85 .10];
T = 1000;
alpha = 1;
beta = 1;
s = zeros(K,1);
f = zeros(K,1);
x = 0:0.01:1;

for t=1:T
    % Choose action.
    theta_hat = zeros(1,K);
    for i=1:K
        theta_hat(1,i) = betarnd(s(i)+alpha, f(i)+beta);
    end
    [~, action] = max(theta_hat);
    
    % Pull lever.
    reward = rand <= theta(action);
    
    % Update.
    s(action) = s(action) + reward;
    f(action) = f(action) + 1 - reward;
    for i=1:K
        y = betapdf(x,s(i)+alpha,f(i)+beta);
        plot(x,y)
        hold on;
    end
    hold off;
    drawnow;
end



