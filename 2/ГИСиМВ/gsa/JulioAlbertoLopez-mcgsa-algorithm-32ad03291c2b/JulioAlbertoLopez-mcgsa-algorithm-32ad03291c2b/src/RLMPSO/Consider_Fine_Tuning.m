%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Created by: Julio Alberto López Gómez (JulioAlberto.Lopez@uclm.es)
% Last edited: 27/12/2018
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [Q_table] = Consider_Fine_Tuning(i,Q_table)
%-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
% INPUT
%   i       --> ith particle
%   Q_table --> Cell which contains the Q_table for each particle
% OUTPUT
%   Q_table --> Updated Q_table considering Fine-Tuning
%-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
Q_table_i      = cell2mat(Q_table(i));
%min_neg       = min(Q_table_i(Q_table_i<0 & Q_table_i>-inf))
min_neg        = min(Q_table_i(Q_table_i>-inf));
Q_table_i(:,5) = min_neg;
Q_table{i}     = Q_table_i;

