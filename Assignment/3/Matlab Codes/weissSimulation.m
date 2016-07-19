function weissSimulation
% This code generates 3 motion patterns, each consisting of two snapshots
% of an image at successive times.  It then computes the likelihood of
% all motions with x-velocities in {-2, -1, 0, 1, 2} and y-velocities in
% {-2, -1, 0, 1, 2}.

velocityRange = -2:2;
for pat = 1:3
   [image1, image2] = generate_example(pat);
%    plot_example(image1,image2, pat);
   freeParameter = 0.75;
   [ll, l2, prior] = compute_loglikelihood(image1,image2,velocityRange,freeParameter);
  % plot_loglikelihood(ll, pat, velocityRange);
  % plot_posterior(prior, pat+3, velocityRange);
   plot_posterior(ll, pat, velocityRange);
%    freeParameter = 0.15;
%    [ll, l2] = compute_loglikelihood(image1,image2,velocityRange,freeParameter);
%     plot_posterior(l2, pat+6, velocityRange);
end

function [ll , l2, prior] = compute_loglikelihood(image1,image2,velocityRange,freeParameter)
% This function computes the log likelihood -- 
% log(P(Image_pair | velocity_vector))
% for each velocity vector in the specified range of velocities in both
% the x and y directions.  Throughout, I use row-column indexing instead
% of x-y indexing to map more directly to the way that images are plotted
% in matlab.
%
% The returned value is not normalized by 1/[2 sigma^2) because this
% constant matters only relative to the variance of the prior.

numVelocities = length(velocityRange);
ll = zeros(numVelocities,numVelocities);
l2 = zeros(numVelocities,numVelocities);
[numRows, numCols] = size(image1);
for columnVelocityIndex = 1:numVelocities
   for rowVelocityIndex = 1:numVelocities
      loglikelihood = nan(numRows, numCols);
      columnVelocity = velocityRange(columnVelocityIndex);
      rowVelocity = velocityRange(rowVelocityIndex);
      for row = 1:numRows 
         for col = 1:numCols
            if (row-rowVelocity >= 1 && row-rowVelocity <= numRows && col-columnVelocity >= 1 && col-columnVelocity <= numCols)
               loglikelihood(row,col) = -(image2(row,col) - image1(row-rowVelocity, col-columnVelocity)).^2;
               
            end
         end
      end
      ll(rowVelocityIndex,columnVelocityIndex) = nanmean(loglikelihood(:));
      prior(rowVelocityIndex,columnVelocityIndex) = (rowVelocity^2 + columnVelocity^2)*freeParameter;
      l2(rowVelocityIndex,columnVelocityIndex) = nanmean(loglikelihood(:)) - prior(rowVelocityIndex,columnVelocityIndex); 
   end
end

function [image1, image2] = generate_example(ix)
% this function generates one of three examples (for ix = 1, 2, 3)
% each example is a pair of images:  image1 is the initial image,
% image2 is the image delta-t time steps later
image1 = [1 0 0 0 0 0 0 0 0 0
     1 0 0 0 0 0 0 0 0 0
     0 1 0 0 0 0 0 0 0 0 
     0 1 0 0 0 0 0 0 0 0
     0 0 1 0 0 0 0 0 0 0 
     0 0 1 0 0 0 0 0 0 0
     0 0 0 1 0 0 0 0 0 0
     0 0 0 1 0 0 0 0 0 0
     0 0 0 0 1 0 0 0 0 0
     0 0 0 0 1 0 0 0 0 0];
if (ix == 1)  
   image2 = [image1(:,10) image1(:,1:9)];
elseif (ix == 2)
   image2 = blkdiag([1 zeros(1,9); zeros(9,1 ) image1(1:9,1:9)]);
else
   image1 = ...
    [0 0 0 0 0 0 0 0 0 0
     0 0 0 0 0 0 0 0 0 0
     0 0 0 0 0 0 0 0 0 0 
     1 1 1 1 1 1 0 0 0 0
     0 0 0 0 0 1 0 0 0 0 
     0 0 0 0 0 1 0 0 0 0
     0 0 0 0 0 1 0 0 0 0
     0 0 0 0 0 1 0 0 0 0
     0 0 0 0 0 1 0 0 0 0
     0 0 0 0 0 1 0 0 0 0];

   image2 = blkdiag([zeros(1,2) zeros(1,8); zeros(9,2) image1(1:9,1:8)]);
   image2(5,1:2)=[1 1];
end

function plot_example(image1,image2,ix)
figure(1)
subplot(1,3,ix)
colormap([0 0 0;1 0 0;0 1 0;1 1 0])
image(image1+2*image2+1)
%set(gca,'ydir','normal')
set(gca,'xtick',1:10);
set(gca,'ytick',1:10);
axis square
axis on

function plot_loglikelihood(ll, ix, velocityRange)
figure(2)
subplot(3,3,ix)
colormap(hot)
imagesc(ll)
axis square
axis on
set(gca,'xtick',1:length(velocityRange));
set(gca,'ytick',1:length(velocityRange));
set(gca,'xticklabel',velocityRange)
set(gca,'yticklabel',velocityRange)
colorbar

function plot_posterior(ll, ix, velocityRange)
figure(2)
subplot(3,3,ix)
colormap(hot)
imagesc(ll)
axis square
axis on
set(gca,'xtick',1:length(velocityRange));
set(gca,'ytick',1:length(velocityRange));
set(gca,'xticklabel',velocityRange)
set(gca,'yticklabel',velocityRange)
colorbar
