sigma1 = 20;
sigma2 = 20;
s1 = 2:2:20;
s2 = 2:2:20;
H = 1:10; %no. of hypothesis%
n = 1; %no. of examples%

%caculating and normalizing prior%
pH = exp(-(s1/sigma1 + s2/sigma2)); 
spH = sum(pH);
npH = pH/spH; 

pxH = zeros(1, length(H));
for h = 1: length(H)
     if (func(2.2,-0.2,h)) % && func(0.5,0.5,h))% && func(1.5,1,h))
        pxH(h) = 1/(4*h*h)^n;
     else
        pxH(h) = 0;
     end
end

%calculating posterior%
pHx = pxH.*npH; 

%plotting posterior
%subplot(2,1,2);  
% bar(pHx);
% title('Posterior with \sigma = 10');
% xlabel('h');
% ylabel('P(H|X)');

%[pHx ; pHx1 ; pHx2]%
%bar(ans')%