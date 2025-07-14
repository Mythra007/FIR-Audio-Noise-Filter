clear; clc; close all;

%% Step 1: Generate the cursed audio
fs = 44100;                       % Sampling frequency
t = 0:1/fs:2;                     % 2 seconds duration
low_tone = 0.6 * sin(2*pi*300*t);      % Desired whisper (300 Hz)
high_tone = 0.4 * sin(2*pi*3000*t);    % Undesired curse (3000 Hz)
noise = 0.05 * randn(size(t));         % Random noise

signal = low_tone + high_tone + noise; % Combined signal

audiowrite('cursed_signal.wav', signal, fs);  % Save to WAV

%% Step 2: Design FIR Low-Pass Filter
cutoff_freq = 1000;                    % 1000 Hz cutoff
norm_cutoff = cutoff_freq / (fs/2);    % Normalize w.r.t. Nyquist
filter_order = 100;                    % Filter order
b = fir1(filter_order, norm_cutoff);   % FIR filter
a = 1;                                 % FIR: denominator is 1

%% Step 3: Apply filter
filtered_signal = filter(b, a, signal);

%% Step 4: Plot time domain
t = (0:length(signal)-1)/fs;
figure;
subplot(2,1,1); plot(t, signal);
title('Original Signal (Time Domain)'); xlabel('Time (s)'); ylabel('Amplitude');

subplot(2,1,2); plot(t, filtered_signal);
title('Filtered Signal (Time Domain)'); xlabel('Time (s)'); ylabel('Amplitude');

%% Step 5: Plot frequency domain
N = length(signal);
f = linspace(0, fs, N);
fft_orig = abs(fft(signal));
fft_filt = abs(fft(filtered_signal));

figure;
subplot(2,1,1); plot(f(1:N/2), fft_orig(1:N/2));
title('Original Signal Spectrum'); xlabel('Frequency (Hz)'); ylabel('Magnitude');

subplot(2,1,2); plot(f(1:N/2), fft_filt(1:N/2));
title('Filtered Signal Spectrum'); xlabel('Frequency (Hz)'); ylabel('Magnitude');

%% Step 6: Listen to both
disp("🔊 Playing original audio...");
soundsc(signal, fs);
pause(length(signal)/fs + 1);
disp("🔊 Playing filtered audio...");
soundsc(filtered_signal, fs);
