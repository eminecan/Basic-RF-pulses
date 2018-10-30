# Basic-RF-pulses
This repository includes basic RF pulses written in Matlab or C++ 


> USE OF WSINC.M AND RFSCALEG.M

 ex: A 6400 microseconds long TBW = 16 hamming windowed sinc RF pulse scaled to (pi/2) flip angle: 

rf = (pi/2)* wsinc(16, 256, 1);

rfscaled = rfscaleg(rf,6.4); 

% peak RF amplitude: 

vpa(max(rfscaled)) % = 0.147 G
