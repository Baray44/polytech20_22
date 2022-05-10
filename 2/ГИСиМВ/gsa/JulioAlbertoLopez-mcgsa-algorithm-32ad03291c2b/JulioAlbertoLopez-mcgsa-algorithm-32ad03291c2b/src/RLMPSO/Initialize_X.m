%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Created by: Julio Alberto López Gómez (JulioAlberto.Lopez@uclm.es)
% Last edited: 27/12/2018
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [M] = Initialize(N,d,Rmax,Rmin)
%-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
% INPUT 
%   N    --> Number of particles
%   d    --> Dimension of the problem
%   Rmax --> Vector which contains de Lower Bound of each variable
%   Rmax --> Vector which contains de Upper Bound of each variable
% OUTPUT
%   M    --> Matrix M with the position of each particle
%-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
for i=1:N
    for j=1:d
        M(i,j) = Rmin(j)+rand()*(Rmax(j)-Rmin(j));
    end
end

end

