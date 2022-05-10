%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Created by: Julio Alberto López Gómez (JulioAlberto.Lopez@uclm.es)
% Last edited: 27/12/2018
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [n_state] = Next_State(i,state,Q_table)
%-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
% INPUT
%   i       --> ith particle
%   state   --> current state of ith particle
%   Q_table --> Cell which contains the Q_table for each particle
% OUTPUT
%   n_state --> next state (column which has the maximum value of state row in Q_table)
 %-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
Q_table_i    = cell2mat(Q_table(i));
[vmax, cmax] = max(Q_table_i(state,:));
n_state      = cmax;

end

