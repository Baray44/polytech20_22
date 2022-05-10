%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% File modified by: Julio Alberto López Gómez (JulioAlberto.Lopez@uclm.es)
% Last edited: 18/10/2018
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;
global initial_flag

global e012_jn func_num nloop KGHM fun GetFunInfoAddr FuncAddr
   
%copy and rename your objective function as functn.m
% !copy objectivefunction.m functn.m
%set values of the following parameters according to your objective function 
%Definitions of paramters can be found in the beginning of SPUCI.m 
%M=10;           %wymiar zadania
N=30;          %liczba osobnikow
%MNFCALL=10000*M;    %liczby wywolan f.celu
%F=0.8;
%CR=0.5;     
ns=1;       % liczba powtorzen optymalizacji
iniflg=0;

XB = []; %zeros(25,ns,M);
FB = zeros(22,ns,1);
LWF = zeros(22,ns,1);
total_register = cell(22,30);
fido_jn = fopen('Out_opt_01.txt' , 'w', 'a'  );    %_jn

for func_num = 1: 1
for i = 1: ns
    fun = func_num;
    if fun == 11; fun = 111; end; % MOD AP RealWorld przepisywanie fun
    if fun == 12; fun = 112; end; % MOD AP RealWorld przepisywanie fun
    if fun == 13; fun = 113; end; % MOD AP RealWorld przepisywanie fun
    if fun == 14; fun = 114; end; % MOD AP RealWorld przepisywanie fun
    if fun == 15; fun = 115; end; % MOD AP RealWorld przepisywanie fun
    if fun == 16; fun = 116; end; % MOD AP RealWorld przepisywanie fun
    if fun == 17; fun = 117; end; % MOD AP RealWorld przepisywanie fun
    if fun == 18; fun = 118; end; % MOD AP RealWorld przepisywanie fun
    if fun == 19; fun = 119; end; % MOD AP RealWorld przepisywanie fun
    if fun == 20; fun = 1110; end; % MOD AP RealWorld przepisywanie fun
    if fun == 21; fun = 12; end; % MOD AP RealWorld przepisywanie fun
    if fun == 22; fun = 13; end; % MOD AP RealWorld przepisywanie fun
    
    CEC2011Dir = 'CEC 2011 Benchmarks';
    addpath(['./', CEC2011Dir]);
    addpath(['./', CEC2011Dir, '/Probs_1_to_8']);
    addpath(['./', CEC2011Dir, '/Prob_9_Transmission_Pricing']);
    addpath(['./', CEC2011Dir, '/Prob_10_Circ_Antenna']);
    addpath(['./', CEC2011Dir, '/Probs_11_ELD_Package/DED Codes']);
    addpath(['./', CEC2011Dir, '/Probs_11_ELD_Package/ELD Codes']);
    addpath(['./', CEC2011Dir, '/Probs_11_ELD_Package/Hydrothermal Codes']);
    addpath(['./', CEC2011Dir, '/Probs_12_to_13_Package']);
    GetFunInfoAddr = @CEC2011get_fun_info;
    FuncAddr = @CEC2011func;
    
    MNFCALL = 150000;
     [bl, bu, M, opt_f, Accuracy] = GetFunInfoAddr(fun);
    N=30; %1*M;          %liczba osobnikow
    if N > 500
        N = 500;
    end;
    if N < 10
        N = 10;
    end;
    x0 = zeros(N,M);
    
    iseed=sum(100*clock);
    isucc = 0;        % counter - for number of succesfull children
    initial_flag=0;   % dla benchmark_func.m - kaze sprawdzic, jaki numer funkcji
        
        b11 = repmat(bl,N,1);
        b22 = repmat((bu-bl),N,1);
        x0=  b11+rand(N,M).*b22; % (bu-bl);
            
        KGHM = i;
        EPS = -inf;
        tic
    [hist,bestx,bestf,ICALL] = DE(x0,bl,bu,MNFCALL,EPS,M,N,iseed,iniflg,isucc);
%[bestx,bestf,ICALL] = SPUCI(x0,bl,bu,maxn,kstop,pcento,peps,ngs,iseed,iniflg);
    time = toc;
    %XB(func_num,i,:) = bestx;
    FB(func_num,i)   = bestf;
    LWF(func_num,i)  = ICALL;
    total_register{func_num,i,1} = hist;
    
%    fprintf(fido_jn, '%6.0f \n', i);
%for ii = 1 func_num=18;:nICALL-1
%     for ii =1 :nloop
%         fprintf(fido_jn, '%6.0f %6.0f %6.0f %10.0f %30.6f %8.0f %8.0f\n', ... 
%             func_num, i, ii, e012_jn(ii,1), e012_jn(ii,2), e012_jn(ii,3), e012_jn(ii,4));
%     end

    save -v6 wyniki XB FB LWF
end
end
time = toc;
fclose(fido_jn);
