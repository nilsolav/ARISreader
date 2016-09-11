function beamnum =lens_distortion(nbeams,theta)
% Removes Lens distortion determined by empirical work at the barge.

switch nbeams
  case 48
    factor = 1;
    a=[.0015, -0.0036, 1.3351, 24.0976];
  case 189
    factor = 4.026;
    a=[.0015, -0.0036, 1.3351, 24.0976];
  case 96
    factor=1.012;
    a=[.0030, -0.0055, 2.6829, 48.04];
  case 381
    factor=4.05;
    a=[.0030, -0.0055, 2.6829, 48.04];
end
 beamnum = round(factor*(a(1)*theta.^3 + a(2)*theta.^2 + a(3)*theta + a(4))+1);


 
