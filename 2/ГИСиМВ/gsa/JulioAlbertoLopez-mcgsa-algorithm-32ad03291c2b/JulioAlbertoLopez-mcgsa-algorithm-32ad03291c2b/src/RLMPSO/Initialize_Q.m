%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Created by: Julio Alberto López Gómez (JulioAlberto.Lopez@uclm.es)
% Last edited: 27/12/2018
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [Q_table] = Initialize_Q(N)
%-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
% INPUT
%   N       --> Number of particles
% OUTPUT
%   Q_table --> Cell which contains the Q_table for each particle in the swarm
%   Exploration: 1|   0   0   0   0   -inf   |
%   Convergence: 2|   0   0   0   0   -inf   |
%   High - Jump: 3|   0   0   0   0   -inf   |
%   Low - Jump:  4|   0   0   0   0   -inf   |
%   Fine-Tuning: 5|   0   0   0   0   -inf   |
%-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
Q_table = cell(1,N);

for i=1:N
    m          = zeros(5);
    m(:,5)     = -inf;
    Q_table{i} = m;
end

end

