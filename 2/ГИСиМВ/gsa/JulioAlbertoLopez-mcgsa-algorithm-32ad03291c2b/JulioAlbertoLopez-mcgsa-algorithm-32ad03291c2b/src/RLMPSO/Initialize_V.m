%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Created by: Julio Alberto López Gómez (JulioAlberto.Lopez@uclm.es)
% Last edited: 27/12/2018
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [V] = Initialize_V(N,d,Vmax,Vmin)
%-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
% INPUT 
%   N    --> Number of particles
%   d    --> Dimension of the problem
%   Vmax --> Vector which contains the maximum value of Speed for each variable (0.2 of the search range)
%   Vmin --> Vector which contains the minimum value of Speed for each variable (0.2 of the search range)
% OUTPUT
%   V    --> Matrix V with the speed of each particle
%-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.

for i=1:N
    for j=1:d
        V(i,j) = (Vmax(j) + abs(Vmin(j))) * rand() - Vmax(j);
    end
end

end

