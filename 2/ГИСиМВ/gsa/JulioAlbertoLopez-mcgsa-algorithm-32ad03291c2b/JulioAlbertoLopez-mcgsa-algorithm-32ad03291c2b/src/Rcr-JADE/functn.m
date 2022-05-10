function y = functn(x)
global initial_flag
global func_num fun GetFunInfoAddr FuncAddr
    y=FuncAddr(x,fun); % cec2011 %y=benchmark_func(x',func_num);
    %%%% For ONLY problems Tersoff Potential Si(b) and  Si(c), the fitness value
    %%%% may be equal to NAN, so it is converted to zero 
    % THIS IS DONE FOLLOWING Elsayed SM Sarker RA Essam DL "GA with a New Multi-Parent Crossover for
    % Solving IEEE-CEC2011 Competition Problems" 2011;
    if isnan(y) ==1
        y=30e30;
    end
return