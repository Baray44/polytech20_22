clear all; close all;

%% Define general parameters:
clock_freq = 100e6;
sample_time = 1/clock_freq;
clock_period = 1/(clock_freq*1e-9); % the clock block takes period of ns

%% 32 TAP FILTER COEFFICIENTS...
fir_coeff = firpm(31,[0 0.1 0.2 0.5]*2,[1 1 0 0]);
fir_coeff = fir_coeff.*(2^11-1);
fir_coeff = round(fir_coeff);

%% CODE TO RUN SIMULATION IN BATCH MODE...

% In this simulation we will bring the two sine waves closer and closer
% together (by increasing the frequency for one and decreasing the
% frequency for the other). 

% The five fo/fs parameters of the two sine waves are defined below
fol_fs = [0.01 0.05 0.10 0.12 0.14];
foh_fs = [0.30 0.25 0.20 0.18 0.16];

for i = 1:length(fol_fs),
    
    % Overwrite the existing phi_inc parameters of the two NCO IP cores
    phi_inc_l = round(fol_fs(i)*2^16);
    phi_inc_h = round(foh_fs(i)*2^16);
    
    % Run simulation
    sim('FIR_32tap');
    
    % Storing data in a Matlab structure
    ex3(i).input_wave = wave_in;
    ex3(i).output_wave = wave_out;
    
    % Computing frequency spectra (of our input and output wave forms) and
    % storing them in the same structure
    temp_spectrum = fftshift(abs(fft(ex3(i).input_wave,1024)));
    ex3(i).input_spectrum = temp_spectrum./max(temp_spectrum);
    temp_spectrum = fftshift(abs(fft(ex3(i).output_wave,1024)));
    ex3(i).output_spectrum = temp_spectrum./max(temp_spectrum);    
end

% Computing and storing the frequency spectrum of the FIR filter
temp_spectrum = fftshift(abs(fft(fir_coeff,1024)));
fir_spectrum = temp_spectrum./max(temp_spectrum); 

%% Graphing results
f = -0.5:1/1024:0.5-1/1024;

for i = 1:length(fol_fs),
    figure(i);
    subplot(221), plot(ex3(i).input_wave); 
    title('input waveform in time domain');
    subplot(222), plot(ex3(i).output_wave);
    title('output waveform in time domain');
    subplot(223), plot(f,ex3(i).input_spectrum,'b-',f,fir_spectrum, 'r--');
    xlabel('f/fs'); legend('input waveform', 'filter');
    title('input and filter spectra');
    subplot(224), plot(f,ex3(i).output_spectrum);
    title('output spectrum'); xlabel('f/fs');
end