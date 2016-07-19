sigma1 = 4;
sigma2 = 4;
s1 = 2:2:20;
s2 = 2:2:20;
H = 1:10;

pH = exp(-(s1/sigma1 + s2/sigma2));
spH = sum(pH);

npH = pH/spH;

figure(1)
subplot(1,2,1);
bar(npH)
title('Prior Distribution \sigma = 4');
xlabel('h');
ylabel('normalised p(h');

sigma1 = 10;
sigma2 = 10;
s1 = 2:2:20;
s2 = 2:2:20;

pH = exp(-(s1/sigma1 + s2/sigma2));
spH = sum(pH);

npH = pH/spH;

subplot(1,2,2);
bar(npH)
title('Prior Distribution \sigma = 10');
xlabel('h');
ylabel('normalised p(h');
