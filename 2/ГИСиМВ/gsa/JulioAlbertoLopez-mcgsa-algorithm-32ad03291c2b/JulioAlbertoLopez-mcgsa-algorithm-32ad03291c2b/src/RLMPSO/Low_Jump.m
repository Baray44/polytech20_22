%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Created by: Julio Alberto López Gómez (JulioAlberto.Lopez@uclm.es)
% Last edited: 27/12/2018
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [Xi] = Low_Jump(i,d,X,pbest,Rmax,Rmin)
%-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
% INPUT
%   i     --> ith particle
%   X     --> Matrix Position
%   pbest --> pbest cell
% OUTPUT
%   Xi    --> New position of ith particle after High-Jump
%-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
% Obtain pbest matrix for i particle
pbest_i = cell2mat(pbest(i));
% Obtain the number of rows of pbest_i
rows_i  = size(pbest_i,1);
% Generate Xi position depart from the last value of pbest_i
Xi      = pbest_i(rows_i,:) + 0.1*randn(1,d).*(Rmax-Rmin);


end

