clc;
noOfSamples = 100000;
burnIn = 1000;

mu = [1 0];
sigmaXSquare = 1;
sigmaYSquare = 3;
correlationXY = -0.5;

sampleX2 = 3;

X1 = zeros(1,noOfSamples);
X2 = zeros(1,noOfSamples);

for i = 1:(noOfSamples + burnIn)
    sampleX1 = normrnd( (mu(1) + ((correlationXY/sigmaYSquare) * (sampleX2 - mu(2))) ), sqrt(sigmaXSquare - ((correlationXY^2)/sigmaYSquare)) );
    sampleX2 = normrnd( (mu(2) + ((correlationXY/sigmaXSquare) * (sampleX1 - mu(1))) ), sqrt(sigmaYSquare - ((correlationXY^2)/sigmaXSquare)) );
    if(i > burnIn)
        X1(i-burnIn) = sampleX1;
        X2(i-burnIn) = sampleX2;
    end
end

figure(2)
histogram(X1,40,'Normalization','pdf')
hold on
y = -6:0.1:6;
f = normpdf(y,mu(1), sqrt(sigmaXSquare));
plot(y,f,'LineWidth',2)

figure(3)
histogram(X2,90,'Normalization','pdf')
hold on
y = -10:0.1:10;
f = normpdf(y,mu(2),sqrt(sigmaYSquare));
plot(y,f,'LineWidth',2)
