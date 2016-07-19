clc;
nsamples = 100000;
smpl = zeros(nsamples,2);
s = 0.9;

proppdf = @(x,y) unifpdf(y-x,-s, s);
proprnd = @(x) x + rand*2*s - s;

for i = 1:nsamples
    
    pdf = @(x)(((x>=0)&(x<=1))* (x.^3));
    smpl(i,1) = mhsample(rand,1,'pdf',pdf,'proprnd',proprnd,'proppdf',proppdf);
    
    pdf = @(x) (((x>=0) & (x<=1)) * (1 - abs(x-smpl(i,1))));
    smpl(i,2) = mhsample(rand,1,'pdf',pdf,'proprnd',proprnd,'proppdf',proppdf);
 
end

covarianceFG = cov(smpl(:,1),smpl(:,2));
expFG = (sum(smpl(:,1))/nsamples) + (sum(smpl(:,2))/nsamples) + covarianceFG(1,2);
disp(expFG);

binEdges = 0:.05:1;
N = hist3(smpl, 'Edges', {binEdges binEdges});
pcolor(binEdges, binEdges, N);
colourmap(jet);
ylabel('F');
xlabel('G'); 
axis square