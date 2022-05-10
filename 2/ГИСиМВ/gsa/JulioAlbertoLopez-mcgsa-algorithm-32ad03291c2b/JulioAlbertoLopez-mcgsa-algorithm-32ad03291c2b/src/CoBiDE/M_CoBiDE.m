%**********************************************************************************
% Author: Yong Wang and Long Li
% Modified by: Julio Alberto López Gómez
% Last Edited: 18/10/2018
% Email: ywang@csu.edu.cn

%************************************ Reference ***********************************
% * Y. Wang, H.-X. Li, T. Huang, and L. Li. Differential evolution based on
% * covariance matrix learning and bimodal distribution parameter setting. 
% * Applied Soft Computing, vol. 18, pp. 232-247, 2014.
%**********************************************************************************

clc;
clear all;

format long
format compact
addpath data

% dimensionality
n  = 30;
% population size
NP = 30;
% maximum number of function evaluations
MAX_FES = 1000;
Hist   = [];
%%
disp([' ------------------------------------------------------------------------------------------------- ']);
disp(['                     Differential Evolution Based on Covariance Matrix Learning                    ']);
disp(['                            and Bimodal Distribution Parameter Setting                             ']);
disp([' ------------------------------------------------------------------------------------------------- ']);

problem_set = [1 : 22]; %13 Real Problems CEC 2011
for problem_index = 7
    
    tic;
    
    problem = problem_set(problem_index);
    
    
    if(problem_index == 9)
        f                    = @(L)cost_fn(L);
        [n, ubound, lbound]  = Bounds_Real_Problems(problem_index)     
    elseif(problem_index == 10)
        f                    = @(L)antennafunccircular(L,[50,120],180,0.5);
        n                    = 12;
        lbound               = [0.2,0.2,0.2,0.2,0.2,0.2,-180,-180,-180,-180,-180,-180]';
        ubound               = [1,1,1,1,1,1,180,180,180,180,180,180]';
    elseif(problem_index == 13)
        f                     = @(L) fn_ELD_6(L);
        [n, ubound, lbound]   = Bounds_Real_Problems(problem_index)
        X                     = initialization(n,NP,ubound,lbound)
        X                     = space_bound(X,ubound,lbound) 
        X = X'; 
    elseif(problem_index == 11)
        f                     = @(x) fn_DED_5(x);
        [n, ubound, lbound]   = Bounds_Real_Problems(problem_index)
        X                     = initialization(n,NP,ubound,lbound)
        X                     = space_bound(X,ubound,lbound) 
    elseif(problem_index == 12)
        f                     = @(x) fn_DED_5(x);       
        [n, ubound, lbound]   = Bounds_Real_Problems(problem_index)
        X                     = initialization(n,NP,ubound,lbound)
        X                     = space_bound(X,ubound,lbound) 
        X = X'; 
    elseif(problem_index == 14)
        f                     = @(x) fn_ELD_13(x);
        [n, ubound, lbound]   = Bounds_Real_Problems(problem_index)
        X                     = initialization(n,NP,ubound,lbound)
        X                     = space_bound(X,ubound,lbound) 
        X = X';  
    elseif(problem_index == 15)
        f                     = @(x) fn_ELD_15(x);
        [n, ubound, lbound]   = Bounds_Real_Problems(problem_index)
        X                     = initialization(n,NP,ubound,lbound)
        X                     = space_bound(X,ubound,lbound) 
    elseif(problem_index == 16)
        f          = @(x) fn_ELD_40(x);
        [n, ubound, lbound]   = Bounds_Real_Problems(problem_index)
        X                     = initialization(n,NP,ubound,lbound)
        X                     = space_bound(X,ubound,lbound) 
    elseif(problem_index == 17)
        f                     = @(x) fn_ELD_140(x);
        [n, ubound, lbound]   = Bounds_Real_Problems(problem_index)
        X                     = initialization(n,NP,ubound,lbound)
        X                     = space_bound(X,ubound,lbound)        
    elseif(problem_index == 20)
        f                     = @(x) fn_HT_ELD_Case_3(x)
        [n, ubound, lbound]   = Bounds_Real_Problems(problem_index)
        X                     = initialization(n,NP,ubound,lbound)
        X                     = space_bound(X,ubound,lbound)    
    elseif(problem_index == 21)
        load('cassini2.mat')
        f                     = @(x) cassini2(x,MGADSMproblem);
        [n, ubound, lbound]   = Bounds_Real_Problems(problem_index)
        X                     = initialization(n,NP,ubound,lbound)
        X                     = space_bound(X,ubound,lbound)  
    elseif(problem_index == 22)
        load('messengerfull.mat')
        f                     = @(x) messengerfull(x,MGADSMproblem);
        [n, ubound, lbound]   = Bounds_Real_Problems(problem_index)
        X                     = initialization(n,NP,ubound,lbound)
        X                     = space_bound(X,ubound,lbound) 
    else
        [n, ubound, lbound]  = Bounds_Real_Problems(problem_index)
        f                    = @(x)bench_func(x,problem_index)     
    end
        X                    = initialization(n,NP,ubound,lbound)
        X                    = space_bound(X,ubound,lbound) 
        X = X';


    pb = .4;
    ps = .5;
    SEL = round(ps*NP);
    
    % load data in CEC2005
    %[lu, o, A, M, a, alpha, b] = selectProblemDataCec(problem, n);
    LB = repmat(lbound, 1, 30)'
    UB = repmat(ubound, 1, 30)'  
    %LB  = lbound';
    %UB  = ubound';

    TIMES = 1;
    Solve = [];

    for time = 1:TIMES

        %X = LB + rand(NP,n).*(UB-LB);
        U  = X;
        

        %%
        %fit = benchmark_func(X, problem, o, A, M, a, alpha, b);
        for i=1:NP
            L      = X(i,:);
            fit(i) = f(L);
        end
        %fit  = test_functions(X,problem_index,n);
        FES  = NP;        
        %
        igen =1;        
         
        %% Initialization for F
        F = zeros(NP, 1);
        sel = rand(NP, 1)<.5;
        num = sum(sel);
        F(sel)  = .65 + .1*tan(pi*(rand(num, 1) - .5));
        F(~sel) = 1 + .1*tan(pi*(rand(NP-num, 1) - .5));
        F  = min(1, F);
        BLF = F<=0;
        while BLF(BLF)
            F(BLF&sel)  = .65 + .1*tan(pi*(rand(sum(BLF&sel), 1) - .5));
            F(BLF&~sel) = 1 + .1*tan(pi*(rand(sum(BLF&~sel), 1) - .5));
            F(BLF)  = min(1, F(BLF));
            BLF_ = F(BLF)<=0;
            BLF(BLF) = BLF_;
        end
        
        %% Initialization for CR
        CR = zeros(NP, 1);
        sel = rand(NP, 1)<.5;
        num = sum(sel);
        CR(sel) = .1 + .1*tan(pi*(rand(num, 1) - .5));
        CR(~sel)= .95 + .1*tan(pi*(rand(NP-num, 1) - .5));
        BLC = CR<=0; BUC = CR>=1;
        CR(BLC) = 0.1; CR(BUC) = 1;
        
        S = true(NP, 1);
        KK=0;
        %%
        while FES < MAX_FES
            
            %% random numbers
            [r1, r2, r3] = select3rands_(NP);
        
            %% Bimodal Distributions for F
            oldF = F;
            F = zeros(NP, 1);
            sel = rand(NP, 1)<.5;
            num = sum(sel);
            F(sel)  = .65 + .1*tan(pi*(rand(num, 1) - .5));
            F(~sel) = 1 + .1*tan(pi*(rand(NP-num,1) - .5));
            F  = min(1 ,F);
            BLF = F<=0;
            while BLF(BLF)
                F(BLF&sel)  = .65 + .1*tan(pi*(rand(sum(BLF&sel), 1) - .5));
                F(BLF&~sel) = 1 + .1*tan(pi*(rand(sum(BLF&~sel), 1) - .5));
                F(BLF)  = min(1 ,F(BLF));
                BLF_ = F(BLF)<=0;
                BLF(BLF) = BLF_;
            end
            chgF = rand(NP, 1) < 1;
            chgF = chgF&(~S);
            F = chgF.*F + (~chgF).*oldF;
            
            %% Bimodal Distributions for CR
            oldCR = CR;
            CR = zeros(NP, 1);
            sel = rand(NP, 1)<.5;
            num = sum(sel);
            CR(sel) = .1 + .1*tan(pi*(rand(num, 1) - .5));
            CR(~sel)= .95 + .1*tan(pi*(rand(NP-num,1) - .5));
            BLC = CR<=0; BUC = CR>=1;
            CR(BLC) = 0.1; CR(BUC) = 1;
            
            chgCR = rand(NP, 1) < 1;
            chgCR = chgCR&(~S);
            CR = chgCR.*CR + (~chgCR).*oldCR;
            
            %% rand/1 mutation strategy
            V = X(r1,:) + F(:, ones(1,n)).*(X(r2,:)-X(r3,:));
            %%
            if problem ~=7 && problem ~=25
                BL = V<LB; V(BL) = 2*LB(BL) - V(BL);
                BLU = V(BL)>UB(BL); BL(BL) = BLU; V(BL) = UB(BL);
                BU = V>UB; V(BU) = 2*UB(BU) - V(BU);
                BUL = V(BU)<LB(BU); BU(BU) = BUL; V(BU) = LB(BU);
            end
            
            %% crossover
            J_= mod(floor(rand(NP, 1)*n), n) + 1;
            J = (J_-1)*NP + (1:NP)';
            crs = rand(NP, n) < CR(:, ones(1, n));
            %%
            if rand<pb
                %% coordinate ratation
                    [nouse, seq] = sort(fit);
                    Xsel = X(seq(1:SEL), :);
                    xmean = mean(Xsel);
                    % covariance matrix calculation
                    C =  1/(SEL-1)*(Xsel - xmean(ones(SEL,1), :))'*(Xsel - xmean(ones(SEL,1), :));
                    C = triu(C) + transpose(triu(C,1)); % enforce symmetry
                    [R,D] = eig(C);
                    % limit condition of C to 1e20 + 1
                    if max(diag(D)) > 1e20*min(diag(D))
                        tmp = max(diag(D))/1e20 - min(diag(D));
                        C = C + tmp*eye(n);
                        [R, D] = eig(C);
                    end
                TM = R;
                TM_=R';
                Xr = X*TM;
                Vr = V*TM;
                %% crossover according to the Eigen coordinate system
                Ur = Xr;
                Ur(J) = Vr(J);
                Ur(crs) = Vr(crs);
                %%
                U = Ur*TM_;
                %%
                if problem ~=7 && problem ~=25
                    BL  = U<LB; U(BL) = 2*LB(BL) - U(BL);
                    BLU = U(BL)>UB(BL); BL(BL) = BLU; U(BL) = UB(BL);
                    BU  = U>UB; U(BU) = 2*UB(BU) - U(BU);
                    BUL = U(BU)<LB(BU); BU(BU) = BUL; U(BU) = LB(BU);
                end
                
            else
                
                U = X;
                U(J) = V(J);
                U(crs) = V(crs);
                
            end
            
            %fit_ = benchmark_func(U, problem, o, A, M, a, alpha, b);
            for i=1:NP
                L = X(i,:)
                fit_(i) = f(L)
            end
%             for i=1:n
%                 L = U(i,:)
%                 fit_(i) = f(L)
%             end
            %fit_  = f(U);
            FES   = FES + NP;
            
            %% selection
            S = fit_ <= fit;
            X(S,:) = U(S,:);
            fit(S) = fit_(S);
            %%
            F(~S) = oldF(~S);
            CR(~S) = oldCR(~S);
            %
            igen = igen +1;
            Hist = [Hist min(fit)];
        end
        
        Solve = [Solve min(fit)];
    
    
    end
    
    disp(['F',num2str(problem_index),...
        ' | ',num2str(mean(Solve)),...
        ' | ',num2str(std(Solve))]);
%     disp(sort(Solve));
    
    toc;
    
end



