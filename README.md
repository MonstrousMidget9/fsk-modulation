
# FSK-modulation

FSK modulation along with AWGN (Additive White Gaussian Noise) in Matlab.

  

FSK stands for Frequency Shift Keying, a digital modulation technique used to transmit digital data over radio frequency (RF) channels. In this technique, binary data is depicted using signals of 2 different frequencies, i.e., "0" by one frequency and "1" by another.

  

## Modulation

To generate a wave consisting of two different frequencies, we can generate two separate waves of one frequency each and sum them up. Although one wave should not be expressed when the other needs to be, so we multiply the waves with the bit stream.

Let us consider two equations,

$$ y_1 = sin{w_1t} $$

$$ y_2 = sin{w_2t} $$

assuming $w_1$ and $w_2$ are associated with binary `1` and `0`, respectively.

  

So $y_1$ must be multiplied by `0` when encountering a `0` in the bit stream, and $y_2$ must be multiplied by `1` (i.e., remain the same) and vice versa. Let $b(t)$ be a function of time representing the binary stream. We can say,

$$y_1' = y_1  \cdot b(t) = b(t) \cdot sin{w_1t} $$

$$y_2' = y_2  \cdot (1-b(t)) = (1-b(t)) \cdot sin{w_2t} $$

graph of $b(t)$

![enter image description here](https://github.com/MonstrousMidget9/fsk-modulation/blob/main/graphs/b%28t%29.png?raw=true)

graph of $y_1'$

![enter image description here](https://github.com/MonstrousMidget9/fsk-modulation/blob/main/graphs/y1.png?raw=true)

graph of $y_2'$

![enter image description here](https://github.com/MonstrousMidget9/fsk-modulation/blob/main/graphs/y2.png?raw=true)

The resultant waveform $y_0$ would be,

$$ y_0 = y_1' + y_2' $$

$$ or $$

$$ y_0 = b(t) \cdot sin{w_1t} + (1-b(t)) \cdot sin{w_2t} $$

  

graph of resultant wave $y_0$,

![enter image description here](https://github.com/MonstrousMidget9/fsk-modulation/blob/main/graphs/y0.png?raw=true)