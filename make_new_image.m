function data=make_new_image(data,frame_in)
%This function reads the data structure after get_frame_new has been called
%  and adds data.image to the structure.
%If get_frame_new detects a change in minrange or maxrange, it sets the data.flag to 1
if data.smooth > 1
    frame = smooth1(frame_in,data.smooth,'expand');
else
    frame=frame_in;
end
frame(1,1)=0; %make sure first element is zero to "paint" outside of sector black

% *** If display parameters change, update the map and mapscale parameters
if data.flag == 1; %Mark that window has changed since last frame
   degtorad=0.0174533; % degrees to radians
   nrows = data.numbeams*data.smooth - data.smooth +1;
   data.map=mapscan(data.imagexsize,data.maxrange,data.minrange,14.4,nrows,data.sampleperchannel);
   ws = 2*data.maxrange*sin(14.25*degtorad)/data.imagexsize; % widthscale meters/pixels
   hs = (data.maxrange - data.minrange*cos(14.25*degtorad))/data.map.iysize; % heightscale meters/pixels
   i0 = data.maxrange/hs; % origin in height direction
   j0 = data.imagexsize/2; % origin in width direction
   data.mapscale =[hs,ws,i0,j0]; %used to go from pixel space to meter space
   data.flag = 0; %reset the data flag
end
% ***


data.image=uint8(reshape(frame(data.map.svector),data.map.iysize,data.imagexsize));
