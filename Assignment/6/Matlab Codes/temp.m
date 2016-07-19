WP = full(WP);
pwt = zeros(size(WP));
for i = 1:size(WP,2)
    dr = sum(WP(:,i));
    if dr ~= 0
        pwt(:,i) = WP(:,i)/dr;
    end
end
ptw = zeros(size(WP));
for i = 1:size(WP,1)
    dr = sum(WP(i,:));
    if dr ~= 0
        ptw(i,:) = WP(i,:)/dr;
    end
end

newWP = (pwt .* ptw);

n = input('topic no. :');
[sortedq,sortingIndices] = sort(newWP(:,n),'descend');
sortedq = num2cell(sortedq);
sortedq = [sortedq WO(sortingIndices)];