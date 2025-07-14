# FIR-Audio-Noise-Filter
Designed a low-pass FIR filter in MATLAB to isolate low-frequency whispers while eliminating high-frequency noise from audio signals.
# FIR Low-Pass Filter for Audio Cleaning (DSP Mini Project)

This project demonstrates the design and application of a **Finite Impulse Response (FIR)** low-pass filter to **clean noisy audio** by removing high-frequency disturbances while preserving a low-frequency whisper signal.

---

## Objective

Design a **low-pass FIR filter** in MATLAB to remove unwanted high-frequency noise (>1000 Hz) from an audio signal containing:
- A 300 Hz whisper tone (desired)
- A 3000 Hz high-pitched noise (undesired)
- Random background noise

---

## Signal Details

- **Sampling Rate**: 44,100 Hz (CD quality)
- **Signal Duration**: 2 seconds
- **Components**:
  - 300 Hz sine wave (whisper)
  - 3000 Hz sine wave (noise)
  - White noise for realism

---

## Filter Design

- **Type**: FIR (Finite Impulse Response)
- **Design Method**: `fir1()` with Hamming window
- **Cutoff Frequency**: 1000 Hz
- **Normalized Cutoff**: `1000 / (44100/2) ≈ 0.045`
- **Order**: 100
- **Justification**: FIR filters are always stable, have linear phase (no phase distortion), and are ideal for audio applications.

---

## MATLAB Implementation Steps

1. **Generate Composite Signal**:
   - Combine sine waves and random noise.

2. **Design Filter**:
   - Use `fir1()` with normalized cutoff frequency and windowing.

3. **Apply Filter**:
   - Use `filter()` function to process the noisy signal.

4. **Plot Results**:
   - Time-domain waveforms (before/after filtering)
   - Frequency spectrum via FFT

5. **Audio Playback**:
   - Use `soundsc()` to compare original vs. filtered audio.

---

## Results

### Time-Domain Analysis
- **Original**: Jagged waveform with rapid fluctuations.
- **Filtered**: Smoother waveform dominated by low-frequency content.

### Frequency-Domain (FFT)
- **Original**: Peaks at ~300 Hz and ~3000 Hz.
- **Filtered**: Only 300 Hz component remains; high-frequency noise is removed.

---

## Conclusion

The FIR filter successfully isolated the low-frequency (300 Hz) whisper while eliminating the high-pitched (3000 Hz) interference and background noise. This project demonstrates the power of FIR filtering in audio signal processing with zero phase distortion.

---

## Concepts Demonstrated

- FIR Filter Design (Windowing Method)
- Frequency Domain Analysis using FFT
- Audio Signal Modeling
- MATLAB signal processing toolbox
- Real-time audio playback and visualization

---

## Extensions / Future Work

- Design a band-pass filter to isolate multiple voice tones
- Implement the same filter in Python using SciPy
- Deploy on a microcontroller with real-time audio input
