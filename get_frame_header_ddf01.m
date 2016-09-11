function header = get_frame_header_ddf01(fid,resolution)
%get_frame_header returns structure with frame header components
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
header.transmit    =fread(fid,1,'int32'); % 0= on  1 = off
%Windowstart 1 to 31 times 0.75 (lo) or 0.375 (hi)
header.windowstart = fread(fid,1,'int32')*(0.375 +(resolution == 0)*0.375);
%Windowlength coded as 0 to 3 
index=fread(fid,1,'int32') +1 +2*(resolution == 0);  %Add 2 if low resolution
if(index > 5)  %put in because shipwreck has incorrect file header
    index = 5;  % This means windowlengths of 36 meters will not be recognized
end
header.windowlength = winlengths(index);
header.threshold   =fread(fid,1,'int32');
header.intensity   =fread(fid,1,'int32');
header.receivergain=fread(fid,1,'int32');
header.degc1       =fread(fid,1,'int32');
header.degc2       =fread(fid,1,'int32');
header.humidity    =fread(fid,1,'int32');
header.focus       =fread(fid,1,'int32');
header.battery     =fread(fid,1,'int32');
header.status1     =char(fread(fid,16,'char'))';
header.status2     =char(fread(fid,16,'char'))';
header.length      =ftell(fid)-initialposition; 
