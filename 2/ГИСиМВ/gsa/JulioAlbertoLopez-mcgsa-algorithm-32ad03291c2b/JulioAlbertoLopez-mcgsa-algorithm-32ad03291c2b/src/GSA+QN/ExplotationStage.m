%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Created by: Julio Alberto López Gómez (JulioAlberto.Lopez@uclm.es)
% Last edited: 27/12/2018
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [X,V,fitness,Fbest]=ExplotationStage(iteration,X,V,fitness,Ibest,Fbest,dim,F_index,Tol)
global contador
% % For real-world problems
% if(F_index == 9)
%     f = @(L) cost_fn(L');
% elseif(F_index == 10)
%     f = @(L)antennafunccircular(L',[50,120],180,0.5);
% elseif(F_index == 11)
%     f = @(L) fn_DED_5(L');
% elseif(F_index == 12)
%     f = @(L) fn_DED_10(L');
% elseif(F_index == 13)
%     f = @(L) fn_ELD_6(L');
% elseif(F_index == 14)
%     f = @(L) fn_ELD_13(L');
% elseif(F_index == 15)
%     f = @(L) fn_ELD_15(L');
% elseif(F_index == 16)
%     f = @(L) fn_ELD_40(L');
% elseif(F_index == 17)
%     f = @(L) fn_ELD_140(L');
% elseif(F_index == 18)
%     f = @(L) fn_HT_ELD_Case_1(L');
% elseif(F_index == 19)
%     f = @(L) fn_HT_ELD_Case_2(L');
% elseif(F_index == 20)
%     f = @(L) fn_HT_ELD_Case_3(L');    
% elseif(F_index == 21)
%     load('cassini2.mat')
%     f = @(L) cassini2(L',MGADSMproblem);
% elseif(F_index == 22)
%     load('messengerfull.mat')
%     f = @(L) messengerfull(L',MGADSMproblem);    
% else
%     f = @(L) bench_func(L',F_index);
% end
% For synthetic problems
f=@(L) test_functions(L',F_index,dim);
% For IEEE CEC 2005 benchmark problems
%f=@(x) feval(benchmark_func(F_index),x');
options = optimoptions(@fminunc,'Display','iter','Algorithm',...
                      'quasi-newton','TolX',Tol,'TolFun',Tol);

[xaux,faux]=fminunc(f,X(:,Ibest),options);
V(:,Ibest)=xaux-X(:,Ibest);
X(:,Ibest)=xaux;
fitness(Ibest)=faux;
if Fbest>faux
    Fbest=faux;
end
end
