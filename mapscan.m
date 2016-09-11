function map=mapscan(ixsize,rmax,rmin,halffov,nbeams,nbins)%,isaris)
% Forms vector that maps data from sample space to image space
% ixsize= number of pixels in horizontal direction in image space
% rmax = maximum range in meters
% rmin = minimum range in meters
% halffov = one-half of sector field of view in degrees
% nbeams = number of beams in sample space
% nbins = number of range bins in sample space
% ix,iy = coordinates of a pixel in image space

%a=2.64317;  % constants for cubic function that reduces distortion in lens
%b=0.002872;
%a1=a*(-14.8) + b*(-14.8)^3;
%a2=a*14.8 + b*14.8^3;
%factor=(nbeams-1)/(a2-a1);
%offset=nbeams-factor*a2;

% if (nargin<7)
%     isaris=0;
% end

degtorad = 3.14159/180.; %conversion of degrees to radians
radtodeg = 180./3.14159;  %conversion of radians to degrees

d2=rmax*cos(halffov*degtorad); %see drawing (distance from point scan touches image boundary to origin)
d3=rmin*cos(halffov*degtorad); %see drawing (bottom of image frame to r,theta origin in meters)
c1= (nbins-1)/(rmax-rmin); %precalcualtion of constants used in do loop below
c2= (nbeams-1)/(2*halffov);

gamma= ixsize/(2*rmax*sin(halffov*degtorad)); %Ratio of pixel number to position in meters

iysize = fix(gamma*(rmax - d3) + 0.5); %number of pixels in image in vertical direction
svector=zeros(ixsize*iysize,1); %make vector and fill in later
ix=[1:ixsize]; % pixels in x dimension
x=((ix-1) - ixsize/2)/gamma; %convert from pixels to meters

for iy = 1:iysize
    y= rmax - (iy-1)/gamma; % convert from pixels to meters
    r= sqrt(y^2 + x.^2); %convert to polar cooridinates
    theta = radtodeg*atan2(x,y); %theta is in degrees
    binnum = fix((r - rmin)*c1 + 1.5); % the rangebin number
    %beamnum = fix((theta + halffov)*c2 + 1.5); %the linear function to get beam number
    %beamnum = round(factor*(a*theta+b*theta.^3) + offset); %remove lens distortion
%     if(isaris)
%         beamnum = get_aris_beam_from_angle(theta);
%     else
        beamnum = lens_distortion(nbeams,theta); %remove lens distortion using empirical formula 
%    end
    %find position in sample array expressed as a vector
     % make pos = 0 if outside sector, else give it the offset in the sample array
    pos = (beamnum > 0).*(beamnum <= nbeams).*(binnum > 0).*(binnum <= nbins).*((beamnum -1)*nbins + binnum);
    svector((ix-1)*iysize + iy)=pos; % The offset in this array is the pixel offset in the image array
                                     % The value at this offset is the offset in the sample array
    if mod(iy,100) == 0    %print your progress every 100 image lines.
       % fprintf('iy %d \n',iy);      
    end
end
svector(svector == 0) = 1; %set all zero elements to one to satisfy matlab indexing rules.
map.iysize=iysize; %Output the calculated y size of the image array and the map vector
map.svector=svector;




