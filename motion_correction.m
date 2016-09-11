%Motion Correction for DIDSON
function framenew=motion_correction(data,velocity)
[n,m]=size(data.frame);  %Find out if 48 or 96 wide
framenew=uint8(zeros(n,m));

time=2*data.maxrange/1500;  %roundtrip time for sound to go maxrange and back
deltarange=(data.maxrange - data.minrange)/512; %Size of range bin.
distance=velocity*time; %distance platform moves in one ping cycle
nbins=round(distance/deltarange); %data shift in bins each ping cycle

if m==96    %if 96 beams
    im=[1,9,17,25,33,41,49,57,65,73,81,89]; % Spacing of beams active in one ping cycle
    offset=[0,4,1,5,2,6,3,7];
    imax=8;
else
    im=[1,5,9,13,17,21,25,29,33,37,41,45];
    offset=[0,2,1,3];  %if 48 beams
    imax=4;
end

nx=0;
for indx=1:imax
    framenew(1+nx:512,im+offset(indx))=data.frame(1:512-nx,im+offset(indx));
    nx=nx+nbins;
end


