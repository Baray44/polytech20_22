%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Created by: Julio Alberto López Gómez (JulioAlberto.Lopez@uclm.es)
% Last edited: 27/12/2018
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [at] = Best_Action(i, states, Q_table)
%-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
% INPUT
%   i       --> Number of the particle for which the best action will be computed
%   states  --> vector of the states for each particle
%   Q_table --> Cell which contains the Q_table for each particle
% OUTPUT
%   at --> best action computed as the maximum column in Q_table for states_i row
%       at = 1 --> Exploration 
%       at = 2 --> Convergence
%       at = 3 --> High-Jump
%       at = 4 --> Low-Jump
%       at = 5 --> Fine-Tuning
%-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.

% Obtain Q_table for i partcle
Q_table_i = cell2mat(Q_table(i));
% Obtain current state for i particle
states_i  = states(i);
% Obtain best_action
[min_action, col_min_action] = max(Q_table_i(states_i,:));
% Resturn best action
at        = col_min_action;

end

