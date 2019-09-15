clear all;

close all;

pkg load communications

[y,fs] = audioread('whatareyou2.wav');

tester = y(:,1);

freq=-fs/2:fs/(length(tester)-1):fs/2;

t = 2/fs:1/fs:9.0413;

plot(freq, abs(fftshift(fft(tester))));

title("Original");

 

grid

 

fc1 = 8000;

AmpMod1 = tester'.*cos(2*pi*fc1*t);

figure

plot(freq, abs(fftshift(fft(AmpMod1))));

title("Amplitude Modulated, fc = 8000");

 

grid();


fc2 = 12000;

AmpMod2 = tester'.*cos(2*pi*fc2*t);

figure();

plot(freq, abs(fftshift(fft(AmpMod2))));

title("Amplitude Modulated, fc = 12000");

 

grid

 

% Demodule each using appropriately synced carrier frequency

white_noice = awgn(AmpMod1,100)


figure

figure();

plot(freq, abs(fftshift(fft(white_noice))));

title("white noice");


Rcv1 = AmpMod1.*cos(2*pi*(fc1)*t);
Rcv11 = AmpMod1.*cos(2*pi*(fc1+8)*t);
figure

plot(freq, abs(fftshift(fft(Rcv1))));

title("Proper Demodulation");

grid
% pause;
% rcv2 = lowpass(Rcv1,5000,fs);
a = indicator(-(1/10000),1/10000,-(1/10000),1/fs)
rcv2 = conv(a,Rcv1)
figure

b = abs(fftshift(fft(rcv2)))
b = b(1:1:398720)

a1 = indicator(-(1/10000),1/10000,-(1/10000),1/fs)
rcv2 = conv(a,Rcv1)
figure

b1 = abs(fftshift(fft(rcv2)))
b1 = b1(1:1:398720)
disp(size(freq))
disp(size(b))

figure
subplot(2,1,1)
plot(freq, b);

title("After passing through LPF frequency");
subplot(2,1,2)
plot(freq, b1);

title("After passing through LPF frequency");

figure

plot(rcv2)

title("After passing through LPF time");

grid

pause;

rcvp2 = audioplayer(rcv2,fs);

play(rcvp2);
