function task3

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
    for i = [Rx,Ry,Bx,By]     
        if (i == Ry || i == By) && d == 1
            Gaussian(i,1,sigma)
            Likelihood(1,d) =  Likelihood(1,d) * Gaussian(i,1,sigma);
        else if (i == Ry || i == By) && d == 2
                Gaussian(i,-1,sigma)
                Likelihood(1,d) =  Likelihood(1,d) * Gaussian(i,-1,sigma);
            else if (i == Rx || i == Bx) && d == 3
                    Gaussian(i,1,sigma)
                    Likelihood(1,d) =  Likelihood(1,d) * Gaussian(i,1,sigma);
                else if (i == Rx || i == Bx) && d == 4
                        Gaussian(i,-1,sigma)
                        Likelihood(1,d) =  Likelihood(1,d) * Gaussian(i,-1,sigma);
                    else
                        Gaussian(i,0,sigma)
                        Likelihood(1,d) =  Likelihood(1,d) * Gaussian(i,0,sigma);
                    end
                end
            end
        end
    end

end

Likelihood;

Posterior = (Likelihood .* PDir)
% Posterior = Posterior./sum(Posterior)

end

function val = Gaussian(x, mean, sigma)
val = ( 1 / (sigma.*sqrt(2*pi)) ) .* exp( -(x - mean).^2 ./ (2*(sigma.^2)) );
end