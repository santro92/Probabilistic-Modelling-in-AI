% Part 2 - UCI Toolbox Gibbs Sampling
clc;

E = 1;
M = 3;
T = 3;
K = 20;
N = 500; 
SEED = 3;
OUTPUT = 0;

[ WP,DP,Z ] = GibbsSamplerLDA( WS,DS,T,N,ALPHA,BETA,SEED,OUTPUT );
[S] = WriteTopics( WP , BETA , WO , K, E, M, 'topics.txt' );

disp('Completed Part 2');