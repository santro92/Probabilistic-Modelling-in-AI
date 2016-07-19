clc;
ALPHA = 0.1;
BETA = 0.01;
M = 200; % no of documents
N = 50;  % no of words per document
V = 20;  % no of words in the vocabulary
K = 3;   % no of topics
Vocab = char(65:84); % Vocabulary with words from A to T

DS = zeros(1,M*N);
for i= 1:M
    DS( ((N*i)-(N-1)) : (N*i)) = (ones(1,N)+i-1);
end

Theta = drchrnd(ones(1,K)*ALPHA, M);
Phi = drchrnd(ones(1,V)*BETA, K);

z= zeros(M,N);
WS = zeros(1,M*N);
Doc = cell(M,1);

for doc = 1:M
    for word=1:N
        z(doc,word) = find(mnrnd(1,Theta(doc,:),1));
        WS((N*doc)-(N-word)) = find(mnrnd(1,Phi(z(doc,word),:),1));
    end
    Doc{doc} = Vocab(WS(((N*doc)-(N-1)) : (N*doc)));
end

WO = cellstr(Vocab');
disp('Completed Part 1');