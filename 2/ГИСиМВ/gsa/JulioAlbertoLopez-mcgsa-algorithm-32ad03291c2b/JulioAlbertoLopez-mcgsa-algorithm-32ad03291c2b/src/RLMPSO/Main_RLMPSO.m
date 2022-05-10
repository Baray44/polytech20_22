%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Created by: Julio Alberto López Gómez (JulioAlberto.Lopez@uclm.es)
% Last edited: 27/12/2018
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc;close all;clear all

P_no          = 30;         % Population size
a             = 150;        % Acceleration factor
p             = 20;         % Descent parameter which controls the decay of speed
J             = 30;         % Maximum Number of FEs allowed in Fine Tuning operation
C             = -2;         % Cost
D             = 1000;       % Delay to consider Fine-Tuning operation
c1            = [2.5, 0.5]; % c1 parameter of PSO
c2            = [0.5, 2.5]; % c2 parameter of PSO
w             = [0.9, 0.4]; % w  parameter of PSO
Max_iteration = 500;        % Maximum number of iterations
tolerancia    = 1e-150;     % Tolerance value
MaxFes        = 15000;      % Maximum number of function evaluations allowed
global fitcount

Results = {};         % Cell where the results of RLMPSO will be saved

for j=21                                           %For each benchmark function    
        if (j == 9)
            f                     = @(x)cost_fn(x);
            [Pg,Pd,g,d,BT,GD_max] = f_bounds();
            d                     = 6*21;
            lbound                = zeros(1,d);
            ubound                = GD_max;
            ubound                = reshape(GD_max,1,126);
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
            d                     = 240;
            Pmin                  = [150,135,73,60,73,57,20,47,20,55];
            Pmax                  = [470,460,340,300,243,160,130,120,80,55];
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
            lim                   = [150,455;150,455;20,130;20,130;150,470; 135,460;135,465;60,300;25,162;25,160; 20,80;20,80;25,85;15,55;15,55;]
            lbound                = lim(:,1)';
            ubound                = lim(:,2)';
        elseif( j ==16)
            f                     = @(x) fn_ELD_40(x);
            d                     = 40;
            lim                   = [36,114;36,114;60,120;80,190;47,97;68,140;110,300;135,300;135,300;130,300;94,375;94,375;125,500;125,500; 125,500;125,500;220,500;220,500;242,550;242,550;254,550;254,550;254,550;254,550;254,550;254,550;10,150;10,150 ;10,150;47,97;60,190;60,190;60,190;90,200;90,200;90,200; 25,110; 25,110;25,110;242,550];
            lbound                = lim(:,1)';
            ubound                = lim(:,2)'; 
        elseif( j == 17)
            f                     = @(x) fn_ELD_140(x);
            d                     = 140;
            lim                   = [71,119;120,189;125,190;125,190;90,190;90,190;280,490; 280,490;260,496;260,496;260,496;260,496;260,506;260,509;260,506;260,505;260,506;260,506;260,505;260,505; 260,505;60,505;260,505;260,505;280,537;280,537;280,549; 280,549;260,501;260,501;260,506;260,506;260,506; 260,506;260,500;260,500;120,241;120,241;423,774; 423,769;3,19;3,28;160,250;160,250;160,250;160,250; 160,250;160,250;160,250;160,250;165,504;165,504; 165,504;165,504;180,471;180,561;103,341;198,617; 100,312;153,471;163,500;95,302;160,511;160,511; 196,490;196,490;196,490;196,490;130,432;130,432; 137,455;137,455;195,541;175,536;175,540;175,538;175,540;330,574;160,531;160,531;200,542;56,132; 115,245;115,245;115,245;207,307;207,307;175,345; 175,345;175,345;175,345;360,580;415,645;795,984; 795,978;578,682;615,720;612,718;612,720;758,964; 755,958;750,1007;750,1006;713,1013;718,1020;791,954; 786,952;795,1006;795,1013;795,1021;795,1015;94,203; 94,203;94,203;244,379;244,379;244,379;95,190;95,189; 116,194;175,321;2,19;4,59;15,83;9,53;12,37;10,34; 112,373;4,20;5,38;5,19;50,98;5,10;42,74;42,74; 41,105;17,51;7,19;7,19;26,40;];
            lbound                = lim(:,1)';
            ubound                = lim(:,2)';
        elseif( j == 18)
            f                     = @(x) fn_HT_ELD_Case_1(x)
            d                     = 96;
            Qmin                  = [5,6,10,13];
            Qmax                  = [15,15,30,25];
            lbound                = repmat(Qmin,1,24);
            ubound                = repmat(Qmax,1,24);  
        elseif( j == 19)
            f                     = @(x) fn_HT_ELD_Case_2(x)
            d                     = 96;
            Qmin                  = [5,6,10,13];
            Qmax                  = [15,15,30,25];
            lbound                = repmat(Qmin,1,24);
            ubound                = repmat(Qmax,1,24); 
        elseif( j == 20)
            f                     = @(x) fn_HT_ELD_Case_3(x)
            d                     = 96;
            Qmin                  = [5,6,10,13];
            Qmax                  = [15,15,30,25];
            lbound                = repmat(Qmin,1,24);
            ubound                = repmat(Qmax,1,24); 
        elseif( j == 21)
            load('cassini2.mat')
            f                     = @(x) cassini2(x,MGADSMproblem);
            d                     = 22;
            Bounds_Matrix         = [-1000,0;3,5;0,1;0,1;100,400;100,500;30,300;400,1600;800,2200;0.01,0.9;0.01,0.9;0.01,0.9;0.01,0.9;0.01,0.9;1.05,6;1.05,6;1.15,6.5;1.7,291;-pi,pi;-pi,pi;-pi,pi;-pi,pi];
            X                     = initialize_f12(P_no,d,Bounds_Matrix);
            lbound                = Bounds_Matrix(:,1)';
            ubound                = Bounds_Matrix(:,2)';
            options_pso           = optimoptions('particleswarm','SwarmSize',P_no,'InitialSwarmMatrix',X,'MaxIterations',Max_iteration-1,'MaxStallIterations',Max_iteration-1,'FunctionTolerance',tolerancia,'OutputFcn',@Ofcn_PSO);
        elseif( j == 22)
            load('messengerfull.mat')
            f                     = @(x) messengerfull(x,MGADSMproblem);
            d                     = 26;
            Bounds_Matrix         = [1900,2300;2.5,4.05;0,1;0,1;100,500;100,500;100,500;100,500;100,500;100,600;0.01,0.99;0.01,0.99;0.01,0.99;0.01,0.99;0.01,0.99;0.01,0.99;1.1,6;1.1,6;1.05,6;1.05,6;1.05,6;-pi,pi;-pi,pi;-pi,pi;-pi,pi;-pi,pi];
            X                     = initialize_f12(P_no,d,Bounds_Matrix);
            lbound                = Bounds_Matrix(:,1)';
            ubound                = Bounds_Matrix(:,2)';
            options_pso           = optimoptions('particleswarm','SwarmSize',P_no,'InitialSwarmMatrix',X,'MaxIterations',Max_iteration-1,'MaxStallIterations',Max_iteration-1,'FunctionTolerance',tolerancia,'OutputFcn',@Ofcn_PSO);       
        else
            f                     = @(x)bench_func(x,j);
            [d, ubound, lbound]   = Bounds_Real_Problems(j);
            if(j == 8)
                ubound = zeros(1,d) + 15;
            end
            if(j == 1 || j == 2 || j == 5 || j == 6 || j == 7)
                lbound = repmat(lbound,1,d);
                ubound = repmat(ubound,1,d);
            end
        end
        for k=1:1                                       %For each repetition
            fprintf('Function %d, Repetition %d\n',j,k)
            Vmax = ubound - ubound * 0.2;
            Vmin = lbound + abs(lbound) * 0.2;
            [x_RLMPSO, f_RLMPSO, Q_table, hist_RLMPSO,ft,t_RLMPSO] = RLMPSO(P_no, d, f, a, p, c1, c2, w, J, ubound, lbound, C ,D, Vmax, Vmin, MaxFes);
            Results{j,k,1} = x_RLMPSO;
            Results{j,k,2} = f_RLMPSO;
            Results{j,k,3} = hist_RLMPSO;
            Results{j,k,4} = t_RLMPSO;
        end
end
