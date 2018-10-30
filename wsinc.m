% Symmetrical Sinc pulse with apodization explained.
% Design of Windowed Sinc RF Pulse

% E. Can 10/2018 @ Stanford University

function rf= wsinc(tbw, res_rf, alpha)
% This function computes a windowed sinc pulse, 
% given a time-bandwidth product, number of samples 
% and type of apodization.

% INPUTS --------------------------------------------------------------
% res_rf - resolution of the sinc (number of points) 
%          res_rf = pulse width of the rf pulse / hardware sampling rate
% tbw - time-bandwidth product 
%       tbw = T*delta(f) = T/t_0 = pw_rf/ t_0 = NL + NR
%       The tbw = 4 -  for 180 degree pulses,
%               = 8 -  for excitation pulses
%               = 12 or 16 - for slab select pulses
%       t_0 - pw of the side lobes
%       NL/NR - number of zero crossings on the Left/Right 
% alpha - 1 for hamming window
%       - 0 for hanning window
% OUTPUTS -------------------------------------------------------------
% rf =  rf pulse (normalized B1(t))
% ---------------------------------------------------------------------

if alpha == 1
    a = 0.46;
else
    a = 0.5;
end

N = tbw / 2; % N = NL = NR for symmetrical sinc pulse. 

x = linspace(-N, N, res_rf); % array of time points 
% x = t/t0 

rf = (1-a+a*cos(pi*x/N)).*sinc(x); 
% rf = A*t_0*((1-alpha)+alpha*cos((pi*t)/(N*t0)))*sin((pi*t)/t0)
% the result of this sinc pulse B1(t) function is independent of actual
% pulsewidth but number of zero crossings and sampling.
%   = A*((1-alpha)+alpha*cos((pi*t)/(N*t0)))*sinc(t/t_0)

% NORMALIZATION: 
rf = rf/sum(rf); % scale the waveform to sum to one, sum(rf) = 1.

% DISPLAY (OPTIONAL)
k = linspace( -res_rf/2, res_rf/2, res_rf); % array of number of points 
plot(k, rf, 'LineWidth',2) % plot rf value vs pulsewidth (hw rate = 2) 
title('Windowed Sinc RF Pulse')
xlabel('time (number of samples)');
ylabel('normalized amplitude');

% VERIFY THE AREA IS EQUAL TO 1
% vpa(trapz(k,rf)) %or 
area_rf = sum(rf) %  sum of the RF waveform is the flip angle in radians

end
