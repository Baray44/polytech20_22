%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Created by: Julio Alberto López Gómez (JulioAlberto.Lopez@uclm.es)
% Last edited: 27/12/2018
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [x_RLMPSO, f_RLMPSO, Q_table, hist_RLMPSO,ft,time] = RLMPSO(N,d, f, a, p, c1, c2, w, J, Rmax, Rmin, C ,D, Vmax, Vmin, MaxFes)

%-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
% INPUT
%   N           --> Number of particles
%   d           --> dimension (not included in the pseudocode)
%   f           --> objective function (not included in the pseoducode)
%   a           --> acceleration factor 150
%   p           --> descent parameter which controls the decay of the velocity 20 
%   c1          --> c1 parameter of PSO c1(1) for exploration, c1(2) for convergence
%   c2          --> c2 parameter of PSO c2(1) for exploration, c2(2) for convergence
%   w           --> w  parameter of PSO w(1) for exploration, w(2) for convergence
%   J           --> Number of FES allowed in fine-tuning operation 30
%   Rmax        --> Vector with Lower Bounds of each variable
%   Rmin        --> Vector with Upper Bounds of each variable
%   C           --> Cost parameter. It penalties solutions -2
%   D           --> Delay to introduce Fine-Tuning Operation
%   Vmax        --> Range of velocity (Upper Bound) 0.2 of the search  range
%   Vmin        --> Range of velocity (Lower Bound) 0.2 of the serarch range
%   MaxFes      --> Maximum number of function evaluations allowed
% OUTPUT
%   x_RLMPSO    --> Best x value obtained after RLMPSO
%   f_RLMPSO    --> Objective value for x_RLMPSO
%   Q_table     --> Final Q-table for each particle at the end of the algorithm
%   hist_RLMPSO --> Historical results of RLMPSO
%   time        --> vector of runtime
%-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.

pbest           = cell(1,N);
fpbest          = cell(1,N);
gbest           = [];
gamma           = 0.8; % Q-learning parameter
hist_RLMPSO     = [];
ft              = zeros(1,N);   % Initially, Fine-Tuning is not consider
time            = [];
cont            = 1;
global fitcount

fitcount        = 0;

%% Initialization
%   Initialize X
%X   = Initialize_X(N,d,Rmax,Rmin);
% RP_21
X                     = initialize_f12(N,d,[Rmin;Rmax]');
% RP_22 
%X                     = initialize_f12(N,d,[Rmin;Rmax]');
%   Initialize V
V   = Initialize_V(N,d,Vmax,Vmin);

%% Compute fitness
fit = [];
% Evaluate all particles
for i=1:size(X,1) % For each particle
    fit(i)    = f(X(i,:));
    pbest{i}  = X(i,:);
    fpbest{i} = fit(i);
end

%% Obtain minimum fit and position in X
[min_fit, xmin_fit] = min(fit);

%% Initialize Q-table
Q_table = Initialize_Q(N);
% Vector which contains the state of each particle
states  = zeros(1,N); 
% Set the state of all particles to Exploration (1)
states  = states + 1;


%% Assign gbest 
gbest   = X(xmin_fit,:);


%% START
while fitcount <= MaxFes
    t_0 = sum(time) + tic;
    for i=1:size(X,1) % For each particle
        % Select the best action at, for the current state st, from the Q_table
        at = Best_Action(i, states, Q_table);
        switch at
            case 1 % Exploration  (First column of Q_table)
                [Xi,Vi] = Exploration(i,X,V,pbest,gbest,w(1),c1(1),c2(1));
                X(i,:)  = Xi;
                V(i,:)  = Vi;
                %break
            case 2 % Convergence  (Second column of Q_table)
                [Xi,Vi] = Convergence(i,X,V,pbest,gbest,w(2),c1(2),c2(2));
                X(i,:)  = Xi;
                V(i,:)  = Vi;
                %break
            case 3 % High-Jump    (Third column of Q_table)
                Xi      = High_Jump(i,d,X,pbest,Rmax,Rmin);
                X(i,:)  = Xi;
                %break
            case 4 % Low-Jump    (Fourth column of Q_table)
                Xi      = Low_Jump(i,d,X,pbest,Rmax,Rmin);
                X(i,:)  = Xi;
                %break
            case 5 % Fine-Tuning (Fifth column of Q_table)
                [Xi,Vi] = Fine_Tuning(i,d,X,V,f,fit,a,J,p,pbest,MaxFes);
                X(i,:)  = Xi;
                V(i,:)  = Vi;
                %Set the inmediate reward to a negative cost value (r == cost)
                r       = C;
                %break
            otherwise
                fprintf('Invalid action. Aborting program \n')
                break
        end
        
        if(at ~= 5) % If action is not Fine-Tuning
            fitness  = f(X(i,:));
            fitcount = fitcount + 1;
            r        = Compute_Reward(fitness, fit(i));
            fit(i)   = fitness;
        end
        
        % DAMPING WALL
        [Xi,Vi]     = Damping_Wall(X(i,:),V(i,:),Rmax,Rmin);
        X(i,:)      = Xi;
        V(i,:)      = Vi;
        
        % Consider Fine-Tuning
        if(fitcount >= D && ft(i) == 0)
            %fprintf('Consider Fine-Tuning \n')
            Q_table = Consider_Fine_Tuning(i,Q_table);
            ft(i)   = 1;
            Q_table{i};
        end
        
        % Get the maximum Q value for the next state st + 1
        n_state     = Next_State(i,states(i),Q_table);
        % Update the Q-table entry
        Q_table     = Update_Q_table(i,states(i),n_state,Q_table,gamma,r,MaxFes);
        % Update the current state
        states(i)   = n_state;

        %Update pbest
        fit_Xi      = f(X(i,:));
        fpbest{i}   = f(pbest{i});

        if(fit_Xi < fpbest{i})
            pbest{i} = X(i,:);
        end
               
        %Update gbest
        if(fit_Xi < min_fit)
            gbest   = X(i,:);
            min_fit = fit_Xi;
        end
        
        Q_table{i};
        fitcount;
    end
    hist_RLMPSO = [hist_RLMPSO;min_fit];
    time(cont)  = toc(t_0);
    cont        = cont + 1;
end
x_RLMPSO = gbest;
f_RLMPSO = min_fit;
end

