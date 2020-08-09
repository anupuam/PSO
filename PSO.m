% Objective: To understand the implementaion of basic PSO algorithm

% Basic Program for Particle Swarm Optimization, Anupam Yadav, 
% NIT Uttarakhand, 14.05.18



maxitr=4000; %% Maximum Iterations
ps=20; % Swarm Size
w=0.9; c1=1.414; c2=c1;itr=1;%% PSO Parameters
D=5;  % No. of Design Variables
lb=-5; ub=5; % Lower and Upper Bounds

% Generation of initial population
pos=lb+(ub-lb)*rand(ps,D); 

% Initial velocity
vel=zeros(ps,D);

pbest=pos;

%Evaluation of objective funciton
fit=fitness(pos);

%Identification of best fitness value
[bestfit,idx]=min(fit);

% Identification of Global Best
gbest=pos(idx,:);

% Main PSO scheme
while itr<maxitr

% Velocity update equation
vel=w*vel +c1*rand()*(pbest-pos)+c2*rand()*(repmat(gbest,ps,1)-pos);

% Position Update Equation
pos=pos+vel;

% Updation process of Global best
fit_n=fitness(pos);
[bestfit_n, idx1]=min(fit_n);
if bestfit_n < bestfit
    gbest =pos(idx1,:);
    bestfit=bestfit_n;
end

% Updation process of Personal best
j=find(fit_n < fit);
fit=fit_n;
pbest(j,:)=pos(j,:);
itr=itr+1;

% Process to maintain all the particle with in search range
for i=1:ps
    tag1=find(pos(i,:)<lb);
    tag2=find(pos(i,:)>ub);
    if length(tag1)>0
    pos(i,tag1)=lb;
    end
    if length(tag2)>0
    pos(i,tag2)=ub;
    end
end
end

bestfit % best fitness value
gbest   % best position