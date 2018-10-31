# Basic-RF-pulses
This repository includes basic RF pulses written in Matlab or C++ 


> USE OF WSINC.M AND RFSCALEG.M

 ex: A 6400 microseconds long TBW = 16 hamming windowed sinc RF pulse scaled to (pi/2) flip angle: 

rf = (pi/2)* wsinc(16, 256, 1);

rfscaled = rfscaleg(rf,6.4); 

% peak RF amplitude: 

vpa(max(rfscaled)) % = 0.147 G
___________________________________________________________________________________________

![Screenshot](https://github.com/eminecan/Basic-RF-pulses/blob/master/sinc.png)

close all
rf0 = wsinc(16,256,1);

MAX_RF0 = vpa(max(rf0))

area_rf0 = vpa(sum(rf0))

plot(rf0, 'LineWidth', 2)

hold on

rfpi = (pi/2)*rf0 ;

MAX_RFPi = vpa(max(rfpi))

area_rfpi = vpa(sum(rfpi))

plot(rfpi,'LineWidth', 2)

legend('area = 1','area = pi/2')
____________________________________________________________________________________________
![Screenshot](https://github.com/eminecan/Basic-RF-pulses/blob/master/sinc-gauss.png)

rfs = rfscaleg(rfpi,6.4);

MAX_RFS = vpa(max(rfs))

area_rfs = vpa(sum(rfs))

dt = 6.4/256;

t = (1:length(rfs))*dt;  % in msec

plot(t, rfs, 'LineWidth', 2); grid on;  

xlabel('Time (msec)'); ylabel('B_1 (Gauss)');

title('Windowed Sinc RF Pulse')

legend('scaled to Gauss')

