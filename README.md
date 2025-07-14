# FIR-Audio-Noise-Filter
Designed a low-pass FIR filter in MATLAB to isolate low-frequency whispers while eliminating high-frequency noise from audio signals.
# FIR Low-Pass Filter for Noise Reduction (MATLAB DSP)

This DSP project filters out **high-frequency noise (>1000 Hz)** from an audio signal using a **custom FIR low-pass filter** designed in MATLAB.

## Objective
- Isolate whisper-like signals (~300 Hz)
- Remove background and 3kHz high-frequency noise
- Retain signal clarity with **no phase distortion**

## Method
- Designed FIR filter with cutoff at 1000 Hz
- Applied filter to noisy audio
- Plotted frequency response, time-domain waveform

## Results
- Original vs Filtered waveform comparison
- Audio quality significantly improved
- FIR filter ensures waveform stability

## Tools Used
- MATLAB (Signal Processing Toolbox)
- Audio Toolbox
- FFT, FIR1, Filter functions

## Audio Samples
*(Include before/after .wav files)*
