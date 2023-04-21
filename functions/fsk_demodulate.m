function [bin] = fsk_demodulate(y, freq1, freq2)

    time_period1 = 1/freq1;
    time_period2 = 1/freq2;
    freq_hcf = gcd(freq1, freq2);
    time_period_lcm = 1/freq_hcf; % formula for lcm of fractions = LCM of numerator / HCF of denominator
    samples_per_wave = 100;
    sample_time = time_period_lcm/samples_per_wave;


    t = 0:sample_time:length(y)*sample_time - sample_time; % time variable
    
    y_ref = sin(2*pi*freq2*t); % reference wave
    
    y = y - y_ref; % subtracting the reference wave from the actual wave
    
    % uncomment the below line to view the resultant waveform
    % plot(t, y, t, zeros(1, length(t)));
    
    bin = '';

    for i = 1:length(t)/samples_per_wave
        wave_sample = y((i-1)*samples_per_wave+1:i*samples_per_wave);
        
        if max(wave_sample) > 1.5
            bin = strcat(bin, '1');
        else
            bin = strcat(bin, '0');
        end
    end
end