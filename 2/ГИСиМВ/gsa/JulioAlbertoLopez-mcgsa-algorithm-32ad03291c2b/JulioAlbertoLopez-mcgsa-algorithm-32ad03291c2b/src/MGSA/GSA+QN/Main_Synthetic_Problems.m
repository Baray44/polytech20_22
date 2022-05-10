%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Created by: Julio Alberto López Gómez (JulioAlberto.Lopez@uclm.es)
% Last edited: 27/12/2018
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc;close all;clear all
global contador
global evolution_pso
global evolution_ga


P_no          = 30;
Max_iteration = 100;
Run_no        = 1;

n_algorithms  = 3;
func          = [1:23];
n_rep         = 30;
tolerancia    = 1e-150;
ElitistCheck  = 1;
Algorithm_num = 0;
chValue       = 20;
k_GSA         = 0;

Results       = cell(n_algorithms,length(func),n_rep);

% %options PSO
 options_pso   = optimoptions('particleswarm','SwarmSize',P_no,'MaxIterations',Max_iteration-1,'MaxStallIterations',Max_iteration-1,'FunctionTolerance',tolerancia, 'OutputFcn',@Ofcn_PSO);
% %options GA
 options_ga    = optimoptions('ga','PopulationSize',P_no,'MaxGenerations',Max_iteration-1,'MaxStallGenerations',Max_iteration-1,'FunctionTolerance',tolerancia,'ConstraintTolerance',tolerancia, 'OutputFcn',@Ofcn_GA);
% %options SA 
 options_sa    = optimoptions('simulannealbnd','MaxFunctionEvaluations',Max_iteration*P_no,'FunctionTolerance',tolerancia, 'OutputFcn',@Ofcn_SA);


for i=4                                       %For each algorithm
    for j=func                                             %For each benchmark function
        [lbound,ubound, d] = test_functions_range(j);
        f                  = @(x)test_functions(x,j,d);
        X                  = initialization(d,P_no,ubound,lbound);
        X                  = space_bound(X,ubound,lbound); 
        X = X';
              
        for k=1:1                                       %For each repetition
            if(i == 1)
                %MATLAB PSO
                fprintf('Algorithm %d function %d repetition %d\n',i,j,k)
                [x_pso, fval_pso, exitflag_pso, output_pso] = particleswarm(f, d, lbound, ubound, options_pso);
                % Save PSO Results
                Results{i,j,k,1}                            = fval_pso;
                Results{i,j,k,2}                            = x_pso;
            elseif(i == 2)
                fprintf('Algorithm %d function %d repetition %d\n',i,j,k)
                %MATLAB GA
                [x_ga, fval_ga, exitflag_ga, output_ga]     = ga(f,d,[],[],[],[],lbound,ubound,[],options_ga);
                % Save GA Results
                Results{i,j,k,1}                            = fval_ga;
                Results{i,j,k,2}                            = x_ga;
            elseif(i==3)
                %MATLA SA
                x0                                         = unifrnd(lbound,ubound,1,d);
                [x_sa, fval_sa, exitFlag_sa, output_sa]    = simulannealbnd(f,x0,lbound,ubound,options_sa);
                % Save SA Results
                Results{i,j,k,1}                           = fval_sa;
                Results{i,j,k,2}                           = x_sa;
            elseif(i == 4)
                %CHAOTIC GSA + QN
                %Note that different values of Algorithm_num and k provide
                %different algorithms:
                %Algorithm_num = 0, k = 0 --> GSA
                %Algorithm_num = 0, k = 1 --> Memetic GSA
                %Algorithm_num = 9, k = 0 --> CGSA
                %Algorithm_num = 9, k = 1 --> M-CGSA
                [cg_curve,eval_f]=GSA(j,P_no,Max_iteration,ElitistCheck,Algorithm_num,chValue,k_GSA);
                Results{i,j,k,1} = cg_curve;
                Results{i,j,k,2} = eval_f;
            end
        end
    end
end

