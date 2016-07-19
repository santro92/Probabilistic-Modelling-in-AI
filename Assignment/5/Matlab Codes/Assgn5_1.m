clc;
mu = zeros(1,100000);
s  = zeros(1,100000);
for salary = [120 60 20]
    for j = 1:100000
        I = 100 + randn*15;
        M = rand < 1/(1+exp(-(I-110)/5));
        U = rand < 1/(1+exp(-(I-100)/5)); 
        mu(j) = str2double(strcat(num2str(M),num2str(U)));
        S = gampdf(salary, (.1 * I) + M + (3 * U),5); 
        s(j) = S;
    end
    denominator = sum(s);
    fprintf('Salary= %d\n' , salary);
    for i = [0 1 10 11]
        disp(sum(s(mu == i))/denominator);
    end
end
