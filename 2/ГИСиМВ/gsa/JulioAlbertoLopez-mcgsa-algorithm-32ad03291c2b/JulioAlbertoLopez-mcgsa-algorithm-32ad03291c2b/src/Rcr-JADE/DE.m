%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% File modified by: Julio Alberto López Gómez (JulioAlberto.Lopez@uclm.es)
% Last edited: 18/10/2018
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%function [bestx,bestf,ICALL] = SPUCI(x0,bl,bu,maxn,kstop,pcento,peps,ngs,iseed,iniflg)
function [hist,bestx,bestf,ICALL] = DE(x0,bl,bu,MNFCALL,EPS,M,N,iseed,iniflg,isucc)
hist = [];
global e012_jn func_num nloop KGHM

% W.Y. Gong, Z.H. Cai, Y. Wang Applied Soft COmputing 2014, 15, pp.
% 149-168;
% Repairing the crossover rate in adaptive differential evolution;
%
% Definition:
%  x0 = the initial parameter array at the start;
%     = the optimized parameter array at the end;
%  f0 = the objective function value corresponding to the initial parameters
%     = the objective function value corresponding to the optimized parameters
%  bl = the lower bound of the parameters
%  bu = the upper bound of the parameters
%  iseed = the random seed number (for repetetive testing purpose)
%  iniflg = flag for initial parameter array (=1, included it in initial
%           population; otherwise, not included)
%  ngs = number of complexes (sub-populations)
%  npg = number of members in a complex 
%  nps = number of members in a simplex
%  nspl = number of evolution steps for each complex before shuffling
%  mings = minimum number of complexes required during the optimization process
%  maxn = maximum number of function evaluations allowed during optimization
%  kstop = maximum number of evolution loops before convergency
%  percento = the percentage change allowed in kstop loops before
%  convergency

uCR = 0.5;                     % JADE - mean crossover
uF = 0.5;                    % JADE - mean F
p100 = floor(0.05*N);   % JADE - how many best individuals are considered, one of them will be chosen in each generation as the xpbest
if p100 < 1
    p100 = 1;
end;
c = 0.1;                % JADE - for CR and uF parameter adaptation (Eq 9 and 11)
A = zeros(N,M);         % JADE A - archive (of size N)
sizeA = 0;              % JADE - initially Archive is empty
CR = zeros(N,1);        % JADE - crossover values used by each individual - generated at each iteration
F = zeros(N,1);         % JADE - F values used by each individual - generated at each iteration

NFCALL = 0;             % liczba wywolan f.celu
randchild = 2;          % liczba osobnikow losowych potrzebnych do wygenerowania potomka 
xf = zeros(N,1);        % wartosci f.celu kazdego osobnika (xf(N))
xchildf = zeros(N,1);   % wartosci f.celu dla child - do porownania z rodzicem 
IRJ = zeros(N,randchild);   % numery losowych osobnikow dla kazdego rodzica (maciez N,randchild)
NCROSS = 1;             % NCROSS - ma wybrac jaka strategia bedzie uzyta przez danego osobnika
APrandom = zeros(N,M+2);   % by uzywac liczb losowych
nloop = 1;

for i = 1 :N
    xf(i) = functn(x0(i,:));    %wywolywanie f.celu
    NFCALL = NFCALL+1;          
end;

[FBEST,KBEST] = min(xf);        %znajdz najmniejsza wartosc f.celu (FBEST) w populacji i numer jej osobnika (KBEST)
    e012_jn(nloop,1) = NFCALL;
    e012_jn(nloop,2) = FBEST;
    e012_jn(nloop,3) = KBEST;

while NFCALL < MNFCALL & FBEST > EPS    % MAIN LOOP
    nloop = nloop + 1;
    rCR = zeros(N,1);   %Gong et al 2014 - to count how many elements of each individual were changed in the last crossover;
    
    xchild = x0;                            % generate children identical to parents
    
    SF = [];               % JADE - clear memory of succesfull F 
    SCR = [];              % JADE - clear memory of succesfull CR
    SF2 = [];              % JADE - clear memory for Lehmer's mean F
    [pB,ipB] = sort(xf');               % JADE - sort individuals according to fitness, from the lowest to highest
   
    % generate random numbers that define 5 random vectors in the population for each parent to create chil
    IRJ = floor(rand(N,randchild)*N+1);
    if sizeA > 0                  % JADE - if Archive is not empty - last vector number may be from current Popul or Archive
        IRJ(:,randchild) = floor(rand(N,1)*(N+sizeA)+1);
    end;
        
    for i = 1: N                            % loop for verification if all random children for particular parents are different and different from the parent       
        % JADE generate parameters CR and F
        CR(i) = uCR + 0.1*randn(1);         % JADE - generate CR(i) for i-th individual (Eq. 8)
        if CR(i) < 0;   CR(i) = 0; end;     % JADE - truncation - see description to Eq 8
        if CR(i) > 1;   CR(i) = 1; end;     % JADE - truncation...
        rc = cauchy(uF,0.1);          % JADE - generate F(i) for i-th individual (Eq. 9)        
        F(i) = rc;
        while F(i) <= 0                     % JADE - F cannot be 0 or negative
            rc = cauchy(uF,0.1);          % JADE - generate F(i) for i-th individual (Eq. 9)
            F(i) = rc;    
        end;
        if F(i) > 1; F(i) = 1; end;         % JADE - truncation to 1   
        
        % Check if all vectors for particular individual i do differ - if not, change
        while (IRJ(i,1)==i)
            IRJ(i,1) = floor(rand(1,1)*N+1); 
        end;  
        while (IRJ(i,2)==i) | (IRJ(i,2)==IRJ(i,1)) 
            IRJ(i,2) = floor(rand(1,1)*(N+sizeA)+1);    % JADE - this individual is generated from Popul and Archive
        end;
%        while (IRJ(i,3)==i) | (IRJ(i,3)==IRJ(i,1)) | (IRJ(i,3)==IRJ(i,2)) 
%            IRJ(i,3) = floor(rand(1,1)*N+1); 
%        end;
%        while (IRJ(i,4)==i) | (IRJ(i,4)==IRJ(i,1)) | (IRJ(i,4)==IRJ(i,2)) | (IRJ(i,4)==IRJ(i,3)) 
%            IRJ(i,4) = floor(rand(1,1)*N+1); 
%        end;
%        while (IRJ(i,5)==i) | (IRJ(i,5)==IRJ(i,1)) | (IRJ(i,5)==IRJ(i,2)) | (IRJ(i,5)==IRJ(i,3)) | (IRJ(i,5)==IRJ(i,4)) 
%            IRJ(i,5) = floor(rand(1,1)*N+1); 
%        end;   
    end;
    
    % CREATE CHILD for each parent according to selected mutation/crossover strategy
    APrandom = rand(N,M+2);     %maciez z liczbami losowymi generowana w kazdej iteracji; M+1 - definiuje 1 index dla ktorego musi byc zmiana wg DE; M+2 - wybiera strategie (NCROSS)
    for i = 1: N
        
        pp = randperm(p100);                % JADE - randomly permute first p100 individuals
        pBEST = ipB(pp(1));                      % JADE - choose the first of the randomly permuted as the best in current generation
        
        % DE/rand/1/bin  %CLASSIC DE
        if NCROSS == 1    %APrandom(i,M+2)<=NCROSS  
            for j = 1: M
                if APrandom(i,j)<CR(i) | j==floor(APrandom(i,M+1)*M+1)
                    if IRJ(i,2)<= N
                        xchild(i,j) = x0(i,j) + F(i)*(x0(pBEST,j)-x0(i,j)) + F(i)*(x0(IRJ(i,1),j)-x0(IRJ(i,2),j));  
                    else
                        IARCH = IRJ(i,2) - N;
                        xchild(i,j) = x0(i,j) + F(i)*(x0(pBEST,j)-x0(i,j)) + F(i)*(x0(IRJ(i,1),j)-A(IARCH,j));
                    end;
                    rCR(i)= rCR(i)+1;   %Gong et al 2014; counting how many times the crossover were made for i-th individual
                end;
            end;
        % DE/rand-to-best/2/bin    
        elseif NCROSS == 2        %APrandom(i,M+2)>NCROSS  
            for j = 1: M
                if APrandom(i,j)<CR(i) | j==floor(APrandom(i,M+1)*M+1)
    xchild(i,j) = x0(i,j) + F(i)*(x0(KBEST,j)-x0(i,j)) + F(i)*(x0(IRJ(i,1),j)-x0(IRJ(i,2),j)) + F(i)*(x0(IRJ(i,3),j)-x0(IRJ(i,4),j));
                end;
            end;
        % DE/rand/2/bin
        elseif NCROSS == 3   % APrandom(i,M+2)>NCROSS
            for j = 1: M
                if APrandom(i,j)<CR(i) | j==floor(APrandom(i,M+1)*M+1)
                    xchild(i,j) = x0(IRJ(i,1),j) + F(i)*(x0(IRJ(i,2),j)-x0(IRJ(i,3),j)) + F(i)*(x0(IRJ(i,4),j)-x0(IRJ(i,5),j));
                end;
            end;
        % DE/current-to-rand/1
        elseif NCROSS == 4     % APrandom(i,M+2)>NCROSS 
            FK = APrandom(i,M+1);
            for j = 1: M
                xchild(i,j) = xo(i,j) + FK*(x0(IRJ(i,1),j)-x0(i,j)) + F(i)*(x0(IRJ(i,2),j)-x0(IRJ(i,3),j));
            end;        
        end;    
        
        % CHECK BOUNDARIES - REBOUND IF NEEDED
        for j = 1: M
            while xchild(i,j) < bl(j) | xchild(i,j) > bu(j)
                if xchild(i,j) < bl(j)
                    xchild(i,j) = bl(j)-(xchild(i,j)-bl(j));
                end
                if xchild(i,j) > bu(j)
                    xchild(i,j) = bu(j)-(xchild(i,j)-bu(j));
                end;
            end;
        end;
                
        % EVALUATE OFFSPRING
        xchildf(i) = functn(xchild(i,:));
        NFCALL = NFCALL + 1;
        
    end;
    % SELECTION
    for i = 1: N
        if xchildf(i) <= xf(i);
            CR(i) = rCR(i)/M; % Gong et al 2014 - "repairing" of the successful CR(i)
            % update A SF and SCR according to JADE
            SF = [SF F(i)];         % JADE - add succesfull F(i) and CR(i) to succesfull lists SF and SCR
            SF2 = [SF2 F(i)^2];     % JADE - for Lehmer mean - F^2 is saved   
            SCR = [SCR CR(i)];      % JADE - for CL mean
            if sizeA < N            % add to the Archive
                sizeA = sizeA + 1;
                A(sizeA,:) = x0(i,:);
            else
                sizeA = N;
                crand = floor(rand(1)*(N+1)+1);   % JADE - crand may be N+1 - if so, current individual is not processed to the archive
                if crand < (N+1); 
                    A(crand,:) = x0(i,:);
                end;
            end;
            % END updationg for JADE
            x0(i,:) = xchild(i,:);
            xf(i) = xchildf(i);
            isucc = isucc + 1;
        end;
    end;
    
    % JADE - update uF and uCR
    [s1,s2]=size(SF);
    if s2>0 
        meanF = sum(SF2)/sum(SF);
        uF = (1-c)*uF + c*meanF;
    end;
    [s1,s2]=size(SCR);
    if s2>0
        uCR = (1-c)*uCR + c*mean(SCR);
    end;
    % END JADE update
    
    % FIND BEST INDIVIDUAL IN POP (FBEST - lowest obj.fct; KBEST - number of BEST IND IN POP)
    [FBEST,KBEST] = min(xf);   
    disp(func_num);
    disp(KGHM);
    disp(NFCALL);
    disp(FBEST);
    hist = [hist;FBEST];
    
    e012_jn(nloop,1) = NFCALL;
    e012_jn(nloop,2) = FBEST;
    e012_jn(nloop,3) = KBEST;
    e012_jn(nloop,4) = isucc;

end;

bestx = x0(KBEST,:);
bestf = FBEST;
ICALL = NFCALL;

return;
