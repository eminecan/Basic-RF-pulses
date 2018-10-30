function rfscaled = rfscaleg(rf, pulsewidth);

%   This function scales a normalized RF waveform to Gauss
%   using the actual pulsewidth.
%   E. Can 10/2018

% rf -- which has sum(rf) = 1 
% pulsewidth -- duration of RF pulse in ms (pw_rf)
% rfscaled -- rf waveform scaled to Gauss
%
size = length(rf);
gamma = 2*pi*4.257; % for proton in kHz/G 
dt = pulsewidth/size; % dwell time: pulse width / resolution 
rfscaled = rf/(gamma * dt);
end
