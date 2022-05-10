x = fftshift(abs(fft(wave_in,1024)));
x = x./max(x);
x1 = fftshift(abs(fft(fir_coeff,1024)));
x1 = x1./max(x1);
f = -0.5:1/1024:0.5-1/1024;
figure; plot(f,x); hold on;
plot(f,x1,'r-.');
xlabel('f/fs');
legend('input waveform','filter');