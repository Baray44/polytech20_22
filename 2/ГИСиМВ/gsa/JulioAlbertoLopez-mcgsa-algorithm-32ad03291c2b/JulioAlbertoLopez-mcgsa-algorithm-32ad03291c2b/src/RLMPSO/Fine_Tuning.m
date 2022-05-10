%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Created by: Julio Alberto López Gómez (JulioAlberto.Lopez@uclm.es)
% Last edited: 27/12/2018
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [pbest_i, Vi] = Fine_Tuning(i,d,X,V,f,fit,a,J,p,pbest,MaxFes)
%-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
% INPUT
%   i       --> ith particle to apply Fine-Tuning operation
%   d       --> dimension of the problem
%   X       --> Matrix with positions of each particle
%   V       --> Matrix with speeds of each particle
%   f       --> Objective function
%   fit     --> Computed fitness
%   a       --> acceleration factor
%   J       --> Number of function evaluations allowed in Fine-Tuning
%   p       --> Descent parameter which controls the decay of speed
%   pbest   --> cell which contains the pbest matrix for each particle
% OUTPUT
%   pbest_i --> New position vector after Fine-Tuning
%   Vi      --> New speed vector after Fine-Tuning
%-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.

global fitcount

mat_pbest_i  = cell2mat(pbest(i));
rows_pbest   = size(mat_pbest_i,1);
pbest_i      = mat_pbest_i(rows_pbest,:);
Vi           = V(i,:);
j            = 1;

for index=1:d
    while(fitcount < MaxFes && j <= J) 
        %Update pbest_i
        pbest_i(index)  = pbest_i(index) + V(index);
        %Evaluate pbest_i
        n_fit    = f(pbest_i);
        fitcount = fitcount + 1;
        %Compute Li,d
        if(n_fit < fit(i))
            Lid  = 2 * V(i,index);
        else
            Lid  = V(i,index)/2;
        end
        %Update Vi,d
        Vid      = a/j^p * (rand() - 0.5) + Lid;
        Vi(d)    = Vid;
        %Update pbest_i
        if(n_fit < fit(i))
            pbest_i(index) = pbest_i(index) + Vid;
        end
        j        = j + 1;
    end
end
end

