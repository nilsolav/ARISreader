function header = get_frame_header_ddf2(fid,resolution)
%get_frame_header_ddf2 returns structure with frame header components
% File is already opened and fid obtained
initialposition = ftell(fid); %get initial position of file pointer
winlengths=[1.125 2.25 4.5 9 18 36];
header.framenumber =fread(fid,1,'int32');
header.frametime   =fread(fid,1,'int32');
header.version     =char(fread(fid,4,'char'));
header.status      =fread(fid,1,'int32');
header.year        =fread(fid,1,'int32');
header.month       =fread(fid,1,'int32');
header.day         =fread(fid,1,'int32');
header.hour        =fread(fid,1,'int32');
header.minute      =fread(fid,1,'int32');
header.second      =fread(fid,1,'int32');
header.hsecond     =fread(fid,1,'int32');
header.transmit    =fread(fid,1,'int32'); % bit2 = 2.0 MHz, bit1 = Enable, bit0 = HF_MODE
%Windowstart 1 to 31 times 0.75 (lo) or 0.375 (hi)
header.windowstart = fread(fid,1,'int32')*(0.375 +(resolution == 0)*0.375); %meters
%Windowlength coded as 0 to 3 but calculated here in meters
index=fread(fid,1,'int32') +1 +2*(resolution == 0);  %Add 2 if low resolution
if(index > 5)  %put in because shipwreck has incorrect file header
    index = 5;  % This means windowlengths of 36 meters will not be recognized at this time
end
header.windowlength = winlengths(index); %meters
header.threshold   =fread(fid,1,'int32');
header.intensity   =fread(fid,1,'int32');
header.receivergain=fread(fid,1,'int32');
header.degc1       =fread(fid,1,'int32');
header.degc2       =fread(fid,1,'int32');
header.humidity    =fread(fid,1,'int32');
header.focus       =fread(fid,1,'int32');
header.battery     =fread(fid,1,'int32');
header.status1     =char(fread(fid,16,'char'))';  %User defined and supplied
header.status2     =char(fread(fid,16,'char'))';
header.velocity    =fread(fid,1,'float32');  %Platform variables supplied by user
header.depth       =fread(fid,1,'float32');
header.altitude    =fread(fid,1,'float32');
header.pitch       =fread(fid,1,'float32');
header.pitchrate   =fread(fid,1,'float32');
header.roll        =fread(fid,1,'float32');
header.rollrate    =fread(fid,1,'float32');
header.heading     =fread(fid,1,'float32');
header.headingrate =fread(fid,1,'float32');
header.sonarpan    =fread(fid,1,'float32');
header.sonartilt   =fread(fid,1,'float32');
header.latitude    =fread(fid,1,'float64');
header.longitude   =fread(fid,1,'float64');
header.userassigned=fread(fid,76,'char');  %Free space for user
header.length      =ftell(fid)-initialposition; 
header.configflags=1; %Standard Didson Classic Windows;