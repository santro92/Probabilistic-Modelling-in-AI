sigma1 = 10;
sigma2 = 10;
s1 = 2:2:20;
s2 = 2:2:20;
H = 1:10; %no. of hypothesis%
n = 1; %no. of examples%

%caculating and normalizing prior%
pH = exp(-(s1/sigma1 + s2/sigma2)); 
% pH = 1./(s1.*s2);
spH = sum(pH);
npH = pH;
%/spH; 

%plotting prior distribution%
% figure(1)
% %subplot(2,1,1);%  
% bar(npH);
% title('Prior Distribution \sigma = 10');
% xlabel('h');
% ylabel('P(h)');

%calculating likelihood%
%x = 2.2;%
%y = -0.2;%
pxH = zeros(1, length(H));
for h = 1: length(H)
     if (func(1.5,0.5,h)) %func(2.2,-0.2,h) && func(0.5,0.5,h) && func(1.5,1,h))
        pxH(h) = 1/(4*h*h)^n;
     else
        pxH(h) = 0;
     end
end

%calculating posterior%
pHx = pxH.*npH;
pHx = pHx/sum(pHx);
%pHx = npH;
%plotting posterior%
%subplot(2,1,2);  
% figure(2)
% bar(pHx);
% title('Posterior with \sigma = 10');
% xlabel('h');
% ylabel('P(H|X)');

%calculating generalization prediction%
A = zeros(21,21);
for i = -10:10
    for j = -10:10
        temp = zeros(1,10);
        for h = 1:10
            if (func(i,j,h))
                temp(1,h) = 1;
            else
                temp(1,h) = 0;
            end
        end
        A(i+11,j+11) = sum(temp.*pHx);
    end
end

%plotting contour map%
figure(3)
[X,Y] = meshgrid(-10:10,-10:10);
contourf(X,Y,log(A));
contourcbar;
title('   log(P(y|X)) for X = {(1.5,0.5)} and \sigma = 10 with \newline Uninformative Prior and Without size principle')
