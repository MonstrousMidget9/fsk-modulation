function [y, t] = fsk_modulate(bin, freq1, freq2)
    % freq1 --> 1
    % freq2 --> 0
    
    % converting char array to integer array
    bin_array = zeros(1, length(bin));
    for i = 1:length(bin_array)
        bin_array(i) = str2double(bin(i));
    end
    
    time_period1 = 1/freq1;
    time_period2 = 1/freq2;
    freq_hcf = gcd(freq1, freq2);
    time_period_lcm = 1/freq_hcf; % formula for lcm of fractions = LCM of numerator / HCF of denominator
    samples_per_wave = 100;
    sample_time = time_period_lcm/samples_per_wave;

    t = 0:sample_time:length(bin_array)*time_period_lcm - sample_time; % time variable
    
    y1 = sin(2*pi*freq1*t);
    y2 = sin(2*pi*freq2*t);


    for i = 1:length(t)/samples_per_wave
        if bin_array(i) == 0
            y1((i-1)*samples_per_wave+1:i*samples_per_wave) = 0;
        else
            y2((i-1)*samples_per_wave+1:i*samples_per_wave) = 0;
        end
    end
    
    y = y1+y2; % adding both the individual waves

    % uncomment the below line to view the modulated signal
    % plot(t, y1, t, y2, t, zeros(1, length(t)));

end