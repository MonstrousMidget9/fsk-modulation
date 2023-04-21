%% task 5
clear, clc

x = encode('hello_world');
snr = 10; % signal to noise ratio

[y, t] = fsk_modulate(x, 10, 5);

y = awgn(y, snr); % add the noise to the signal

% uncomment the below to view signal with gaussian noise
% figure(1)
% plot(t, y, t, zeros(length(t)));
% xlabel("time");

d = fsk_demodulate(y, 10, 5);
msg = decode(d);
disp('demodulated message:')
disp(msg);

% error rate
errors = 0;
for i = 1:length(x)
    if x(i) ~= d(i)
        errors = errors+1;
    end
end
disp('error percentage(%) is:');
disp(errors/length(x) *100); % no of flipped bits / total no of bits


