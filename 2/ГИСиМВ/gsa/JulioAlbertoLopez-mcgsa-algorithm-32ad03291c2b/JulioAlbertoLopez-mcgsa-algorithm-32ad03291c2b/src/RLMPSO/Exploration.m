%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Created by: Julio Alberto López Gómez (JulioAlberto.Lopez@uclm.es)
% Last edited: 27/12/2018
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [Xi,Vi] = Exploration(i,X,V,pbest,gbest,w,c1,c2)
%-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
% INPUT
%   i     --> ith particle
%   X     --> Matrix which contains the position of the particles
%   V     --> Matrix which contains the speeds of the particles
%   pbest --> Cell which contains the best positions of each particle
%   gbest --> global best particle
%   w     --> intertia weight 
%   c1    --> cognitive acceleration coefficient
%   c2    --> social accleration coefficient
% OUTPUT
%   Xi    --> New position for ith particle
%   Vi    --> New speed for ith particle
%-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
pbest_i = cell2mat(pbest(i));
rows    = size(pbest_i,1);

Vi      = w * V(i,:) + c1 * rand * (pbest_i(rows,:) - X(i,:)) + c2 * rand * (gbest - X(i,:));
Xi      = X(i,:) + Vi;

end

