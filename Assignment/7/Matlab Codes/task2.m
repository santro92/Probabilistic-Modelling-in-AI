ALPHA = 0.5;
SIGMA = 0.1;
N = 500; % Total no. of customers
K = 1; % Current no. of occupied tables

TABLES = zeros(1,N);
TABLES(K) = 1;
THETA = zeros(2,N);
THETA(:,K) = [rand;rand];

for i = 2:N  
    table_prob = zeros(1,K+1);    
    for k = 1:K
        table_prob(k) = TABLES(k)/(i-1+ALPHA);
    end    
    table_prob(K+1) = ALPHA/(i-1+ALPHA);
    
    table_chosen = find(mnrnd(1,table_prob));  
    if TABLES(table_chosen) == 0
        K = K+1;
        THETA(:,K) = [rand;rand];
    end
    TABLES(table_chosen) = TABLES(table_chosen)+1;
end

figure(1);
hold on;
for k = 1:K
    cc=rand(1,3);
    for j = 1:TABLES(k)
        x = THETA(1,k) + SIGMA*randn;
        y = THETA(2,k) + SIGMA*randn;
        scatter(x,y,30,cc);
        drawnow;
        t = sprintf('%d Cluster',k);
        title(t);   
    end
end
hold off;