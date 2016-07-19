clc;

DP = full(DP);
ent = 0;
for i = 1:size(DP,1)
    dr = sum(DP(i,:));
    if dr ~= 0
        DP(i,:) = DP(i,:)/dr;
        temp = DP(i,DP(i,:) > 0);
        ent  = ent + sum(temp .* log(temp));   
    end
end
fprintf('entropy of topic distribution: %f \n', (-1 * ent)/200);

WP = full(WP);
WP = [WP;zeros(V-size(WP,1),3)];
ent = 0;
for i = 1:size(WP,2)
    dr = sum(WP(:,i));
    if dr ~= 0
        WP(:,i) = WP(:,i)/dr;
        temp = WP(WP(:,i) > 0,i);
        ent  = ent + sum(temp .* log(temp));
    end
end
fprintf('entropy of words distribution: %f \n',(-1 * ent)/3);
