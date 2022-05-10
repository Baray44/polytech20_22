%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Created by: Julio Alberto López Gómez (JulioAlberto.Lopez@uclm.es)
% Last edited: 27/12/2018
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [Q_table] = Update_Q_table(i,state,n_state,Q_table,gamma,r,MaxFes)
%-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
% INPUT
%   i       --> ith particle
%   state   --> Current state of ith particle
%   n_state --> New state computed for ith particle
%   Q_table --> Cell which contains the Q_table for each particle
%   gamma   --> Parameter for Q-learning algorithm
%   r       --> Obtained reward
%   MaxFes  --> Maximum number of function evaluations allowed 
% OUTPUT
%   Q_table --> Cell which contains the Q_table for each particle updated
%-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
global fitcount

alpha     = 1 - (gamma * (fitcount/MaxFes));
Q_table_i = cell2mat(Q_table(i));
for index=1:size(Q_table_i,2)
    Q_table_i(state,index) = Q_table_i(state,index) + alpha * (r + gamma * (max(Q_table_i(n_state,:)) - Q_table_i(state,index)));
end

% Update Q_table for particle i 
Q_table{i} = Q_table_i;

end

