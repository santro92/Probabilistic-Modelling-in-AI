function plotprobcont 
hold off
models = 0:.001:1;
h = 0; t = 0;
ct = 1;
label = 'priors';
for outcome = [1 0 0 1 0 0 0 1 ]
  subplot(2,4,ct) 
  posterior = betapdf(models,h+1,t+1);
  hold off
  plot(models, posterior);
  hold on
  title(label);
  xlabel('model'); 
  set(gca,'ylim',[0 3]);
  h = h + outcome;
  t = t + (1-outcome);
  label = 'T';
  if (outcome)
    label = 'H';
  end
  label = sprintf('trial %d: %s',ct,label); 
  ct = ct + 1;
end
