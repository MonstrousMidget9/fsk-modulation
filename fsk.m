%% task 4
clear, clc

x = encode('hi');


[y, t] = fsk_modulate(x, 10, 5);



d = fsk_demodulate(y, 10, 5);
msg = decode(d);
disp('demodulated message:')
disp(msg);




% uncomment the below to view the output waveform from the modulate function
% figure(1)
% plot(t, y, t, zeros(length(t)));
% xlabel("time");

