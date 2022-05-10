%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Created by: Julio Alberto López Gómez (JulioAlberto.Lopez@uclm.es)
% Last edited: 27/12/2018
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [Xi,Vi] = Damping_Wall(Xi,Vi,Rmax,Rmin)
%-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
% INPUT
%   Xi   --> Current position of ith particle
%   Vi   --> Current speed of ith particle
%   Rmax --> Vector which contains the upper bound of each dimension
%   Rmin --> Vector which contains the lower bound of each dimension
% OUTPUT
%   Xi   --> New position after Damping Wall operation
%   Vi   --> New speed after Damping Wall operation
%-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.

for i=1:size(Xi,2) 
    if(Xi(i) < Rmin(i))
        Xi(i) = Rmin(i) + (rand()*0.2)-0.1;
        Vi(i) = -Vi(i);
    elseif(Xi(i) > Rmax(i))
        Xi(i) = Rmax(i) - (rand() * 0.2)-0.1; 
        Vi(i) = -Vi(i);
    end

end

