clock_freq = 100e6
sample_time = 1/clock_freq;
fir_coeff = firpm(20,[0 0.1 0.2 0.5]*2,[1 1 0 0]);