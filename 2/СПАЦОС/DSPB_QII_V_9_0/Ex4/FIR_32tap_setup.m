%% Define general parameters:
clock_freq = 100e6;
sample_time = 1/clock_freq;
clock_period = 1/(clock_freq*1e-9); % the clock block takes period of ns
%% 32 TAP FILTER COEFFICIENTS....
fir_coeff = firpm(31,[0 0.1 0.2 0.5]*2,[1 1 0 0]);
fir_coeff = fir_coeff.*(2^11-1);
fir_coeff = round(fir_coeff);
%% setup NCO
% 30 MHz and 1 MHz sine wave
phi_inc_h = round((30e6/clock_freq)*2^16); % 16 bit accumulator percision
phi_inc_l = round((1e6/clock_freq)*2^16);  % 16 bit accumulator percision