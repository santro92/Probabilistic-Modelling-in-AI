clc;

load bagofwords_psychreview;
load words_psychreview;

E = 1;
M = 3;
T = 50;
K = 50;
N = 500; 
SEED = 3;
OUTPUT = 1;
ALPHA = 0.1;
BETA = 0.01;


[ WP,DP,Z ] = GibbsSamplerLDA( WS, DS, T, N, ALPHA, BETA, SEED, OUTPUT );
[S] = WriteTopics( WP , BETA, WO, K, E, M, 'topics1.txt' );