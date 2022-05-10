%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Created by: Julio Alberto López Gómez (JulioAlberto.Lopez@uclm.es)
% Last edited: 27/12/2018
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc;close all;clear all
global contador
global evolution_pso
global evolution_ga

P_no          = 30;
Max_iteration = 250;
Run_no        = 1;

n_algorithms  = 3;
func          = [5];
n_rep         = 3;
tolerancia    = 1e-150;
ElitistCheck  = 1;
Algorithm_num = 9;
chValue       = 20;
max_func_ev   = 150000;
k_GSA         = 0;

Evolution     = cell(n_algorithms,max(func),n_rep);
Results       = cell(n_algorithms,max(func),n_rep);


% %options PSO
 options_pso   = optimoptions('particleswarm','SwarmSize',P_no,'MaxIterations',Max_iteration-1,'MaxStallIterations',Max_iteration-1,'FunctionTolerance',tolerancia,'OutputFcn',@Ofcn_PSO);
% %options GA
 options_ga    = optimoptions('ga','PopulationSize',P_no,'MaxGenerations',Max_iteration-1,'MaxStallGenerations',Max_iteration-1,'FunctionTolerance',tolerancia,'ConstraintTolerance',tolerancia, 'OutputFcn',@Ofcn_GA);
% %options SA 
 options_sa    = optimoptions('simulannealbnd','MaxFunctionEvaluations',Max_iteration*P_no,'FunctionTolerance',tolerancia, 'OutputFcn',@Ofcn_SA);


for i=4                                                 %For each algorithm
    for j=1                                             %For each benchmark function    
        if (j == 9)
            f                     = @(x)cost_fn(x);
            [Pg,Pd,g,d,BT,GD_max] = f_bounds();
            d                     = 6*21;
            lbound                = zeros(1,d);
            ubound                = GD_max;
            options_pso           = optimoptions('particleswarm','SwarmSize',P_no,'MaxIterations',Max_iteration-1,'MaxStallIterations',Max_iteration-1,'FunctionTolerance',tolerancia,'OutputFcn',@Ofcn_PSO);
        elseif( j == 10)
            f                     = @(x)antennafunccircular(x,[50,120],180,0.5);
            d                     = 12;
            lbound1               = 0.2;
            ubound1               = 1;
            lbound2               = -180;
            ubound2               = 180;
            lbound                = [0.2,0.2,0.2,0.2,0.2,0.2,-180,-180,-180,-180,-180,-180];
            ubound                = [1,1,1,1,1,1,180,180,180,180,180,180];
            X                     = initialize_f10(P_no, d, lbound1,ubound1,lbound2,ubound2);
            options_pso           = optimoptions('particleswarm','SwarmSize',P_no,'InitialSwarmMatrix',X,'MaxIterations',Max_iteration-1,'MaxStallIterations',Max_iteration-1,'FunctionTolerance',tolerancia,'OutputFcn',@Ofcn_PSO);
        elseif( j == 11)
            f                     = @(x) fn_DED_5(x);
            d                     = 120;
            Pmin                  = [10,20,30,40,50;];
            Pmax                  = [75,125,175,250,300;];
            lbound                = repmat(Pmin,1,24);
            ubound                = repmat(Pmax,1,24);
            options_pso           = optimoptions('particleswarm','SwarmSize',P_no,'MaxIterations',Max_iteration-1,'MaxStallIterations',Max_iteration-1,'FunctionTolerance',tolerancia,'OutputFcn',@Ofcn_PSO);
        elseif( j == 12)
            f                     = @(x) fn_DED_10(x);
            d                     = 216;
            Pmin                  = [150,135,73,60,73,57,20,47,20;];
            Pmax                  = [470,460,340,300,243,160,130,120,80;];
            lbound                = repmat(Pmin,1,24);
            ubound                = repmat(Pmax,1,24);
            options_pso           = optimoptions('particleswarm','SwarmSize',P_no,'MaxIterations',Max_iteration-1,'MaxStallIterations',Max_iteration-1,'FunctionTolerance',tolerancia,'OutputFcn',@Ofcn_PSO);
        elseif( j == 13)
            f                     = @(x) fn_ELD_6(x)
            d                     = 6;
            lbound                = [100,50,80,50,50,50];
            ubound                = [500,200,300,150,200,120];
        elseif( j == 14)
            f                     = @(x) fn_ELD_13(x);
            d                     = 13;
            lbound                = [0,0,0,60,60,60,60,60,60,40,40,55,55];
            ubound                = [680,360,360,180,180,180,180,180,180,120,120,120,120];
        elseif( j == 15)
            f                     = @(x) fn_ELD_15(x);
            d                     = 15;
            lbound                = [];
            ubound                = [];
        elseif( j ==16)
            f                     = @(x) fn_ELD_40(x);
            d                     = 40;
            lbound                = [];
            ubound                = [];
        elseif( j == 17)
            f                     = @(x) fn_ELD_140(x);
            d                     = 140;
            lbound                = [];
            ubound                = [];
        elseif( j == 18)
            f                     = @(x) fn_HT_ELD_Case_1(x)
            d                     = 96;
            Qmin                  = [5,6,10,13];
            Qmax                  = [15,15,30,25];
            lbound                = repmat(Qmin,1,24)';
            ubound                = repmat(Qmax,1,24)';  
        elseif( j == 19)
            f                     = @(x) fn_HT_ELD_Case_2(x)
            d                     = 96;
            Qmin                  = [5,6,10,13];
            Qmax                  = [15,15,30,25];
            lbound                = repmat(Qmin,1,24)';
            ubound                = repmat(Qmax,1,24)'; 
        elseif( j == 20)
            f                     = @(x) fn_HT_ELD_Case_3(x)
            d                     = 96;
            Qmin                  = [5,6,10,13];
            Qmax                  = [15,15,30,25];
            lbound                = repmat(Qmin,1,24)';
            ubound                = repmat(Qmax,1,24)'; 
        elseif( j == 21)
            load('cassini2.mat')
            f                     = @(x) cassini2(x,MGADSMproblem);
            d                     = 22;
            Bounds_Matrix         = [-1000,0;3,5;0,1;0,1;100,400;100,500;30,300;400,1600;800,2200;0.01,0.9;0.01,0.9;0.01,0.9;0.01,0.9;0.01,0.9;1.05,6;1.05,6;1.15,6.5;1.7,291;-pi,pi;-pi,pi;-pi,pi;-pi,pi];
            X                     = initialize_f12(P_no,d,Bounds_Matrix);
            lbound                = Bounds_Matrix(:,1);
            ubound                = Bounds_Matrix(:,2);
            options_pso           = optimoptions('particleswarm','SwarmSize',P_no,'InitialSwarmMatrix',X,'MaxIterations',Max_iteration-1,'MaxStallIterations',Max_iteration-1,'FunctionTolerance',tolerancia,'OutputFcn',@Ofcn_PSO);
        elseif( j == 22)
            load('messengerfull.mat')
            f                     = @(x) messengerfull(x,MGADSMproblem);
            d                     = 26;
            Bounds_Matrix         = [1900,2300;2.5,4.05;0,1;0,1;100,500;100,500;100,500;100,500;100,500;100,600;0.01,0.99;0.01,0.99;0.01,0.99;0.01,0.99;0.01,0.99;0.01,0.99;1.1,6;1.1,6;1.05,6;1.05,6;1.05,6;-pi,pi;-pi,pi;-pi,pi;-pi,pi;-pi,pi];
            X                     = initialize_f12(P_no,d,Bounds_Matrix);
            lbound                = Bounds_Matrix(:,1);
            ubound                = Bounds_Matrix(:,2);
            options_pso           = optimoptions('particleswarm','SwarmSize',P_no,'InitialSwarmMatrix',X,'MaxIterations',Max_iteration-1,'MaxStallIterations',Max_iteration-1,'FunctionTolerance',tolerancia,'OutputFcn',@Ofcn_PSO);       
        else
            f                     = @(x)bench_func(x,j);
            [d, ubound, lbound]   = Bounds_Real_Problems(j);
            X                     = initialization(P_no,d,ubound,lbound)
            size(X);
            X                     = space_bound(X,ubound,lbound); 
            if( j == 8)
                options_pso           = optimoptions('particleswarm','SwarmSize',P_no,'InitialSwarmMatrix',X,'MaxIterations',Max_iteration-1,'MaxStallIterations',Max_iteration-1,'FunctionTolerance',tolerancia,'OutputFcn',@Ofcn_PSO_8);
    
            else
                options_pso           = optimoptions('particleswarm','SwarmSize',P_no,'InitialSwarmMatrix',X,'MaxIterations',Max_iteration-1,'MaxStallIterations',Max_iteration-1,'FunctionTolerance',tolerancia,'OutputFcn',@Ofcn_PSO);
            end
            X = X';
        end
        for k=1:1                                       %For each repetition
            if(i == 1)
                %MATLAB PSO
                global evolution_pso
                fprintf('Algorithm %d function %d repetition %d\n',i,j,k)
                [x_pso, fval_pso, exitflag_pso, output_pso] = particleswarm(f, d, lbound, ubound, options_pso);
                % Save PSO Results
                Results{i,j,k,1}                            = fval_pso;
                Results{i,j,k,2}                            = x_pso;
                Evolution{i,j,k}                            = evolution_pso;
                clearvars -global evolution_pso;
            elseif(i == 2)
                global evolution_ga
                fprintf('Algorithm %d function %d repetition %d\n',i,j,k)
                %MATLAB GA
                [x_ga, fval_ga, exitflag_ga, output_ga]     = ga(f,d,[],[],[],[],lbound,ubound,[],options_ga);
                % Save GA Results
                Results{i,j,k,1}                            = fval_ga;
                Results{i,j,k,2}                            = x_ga;
                Evolution{i,j,k}                            = evolution_ga;
                clearvars -global evolution_ga;
            elseif(i == 4)
                Algorithm_num = 9;
                k_GSA         = 1;
                %CHAOTIC GSA + QN
                %Note that different values of Algorithm_num and k provide
                %different algorithms:
                %Algorithm_num = 0, k = 0 --> GSA
                %Algorithm_num = 0, k = 1 --> Memetic GSA
                %Algorithm_num = 9, k = 0 --> CGSA
                %Algorithm_num = 9, k = 1 --> M-CGSA
                tic;
                [cg_curve,eval_f] = GSA(j,P_no,Max_iteration,ElitistCheck,Algorithm_num,chValue,k_GSA);
                time_calc   = toc;
                Results{i,j,k,1}            = cg_curve;
                Results{i,j,k,2}            = eval_f;

            end
        end
    end
end
