% Task 3 for directions
clc;

sigma = 5;
Rx = 0.75;
Ry = -0.6;
Bx = 1.4;
By = -0.2;

Dir = [1,2,3,4];
PDir = [1,5,1,1];
PDir = PDir./sum(PDir);

Likelihood = ones(1,4);

for d = Dir
    ct = 1;
    for i = [Rx,Ry,Bx,By]
        
        if (i == Rx || i == Bx) && d == 3
        Likelihood(ct,d) =  Likelihood(ct,d) * normpdf(i,1,sigma);
        else if (i == Rx || i == Bx) && d == 4
                Likelihood(ct,d) =  Likelihood(ct,d) * normpdf(i,-1,sigma);
            else if (i == Ry || i == By) && d == 1
                    Likelihood(ct,d) =  Likelihood(ct,d) * normpdf(i,1,sigma);
                else if (i == Ry || i == By) && d == 2
                    Likelihood(ct,d) =  Likelihood(ct,d) * normpdf(i,-1,sigma);
                    else
                        Likelihood(ct,d) =  Likelihood(ct,d) * normpdf(i,0,sigma);
                    end
                end
            end
        end
    end
end

Likelihood

Posterior = (Likelihood .* PDir);
Posterior = Posterior./sum(Posterior)