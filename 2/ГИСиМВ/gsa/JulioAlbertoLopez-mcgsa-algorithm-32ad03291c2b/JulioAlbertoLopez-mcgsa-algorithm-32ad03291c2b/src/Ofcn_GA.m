function [state,options,optchanged] = Ofcn_GA(options,state,flag)

global evolution_ga
optchanged   = false;

if(state.Generation >0)
    evolution_ga = [evolution_ga; [state.Generation, state.Best(state.Generation)]];
end

save('ev_GA.mat','evolution_ga');
end