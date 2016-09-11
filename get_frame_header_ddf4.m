function header = get_frame_header_ddf4(fid,resolution,serialnumber)
%get_frame_header_ddf4 returns structure with frame header components
% File is already opened and fid obtained
% resolution (frequency mode) Lo = 0  Hi = 1
% serialnumber = serial number of sonar providing this data

initialposition = ftell(fid); %get initial position of file pointer

header.framenumber =fread(fid,1,'int32');
header.frametime   =fread(fid,2,'int32');
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

header.windowstart =fread(fid,1,'int32'); % This will be updated at the end of this routine

%Windowlength index determined. Windowlength determined at end of file.
index=fread(fid,1,'int32') +1 +2*(resolution == 0);  %Add 2 if low resolution (index between 1 and 6)

header.threshold   =fread(fid,1,'int32');
header.intensity   =fread(fid,1,'int32');
header.receivergain=fread(fid,1,'int32');
header.degc1       =fread(fid,1,'int32');
header.degc2       =fread(fid,1,'int32');
header.humidity    =fread(fid,1,'int32');
header.focus       =fread(fid,1,'int32');
header.battery     =fread(fid,1,'int32');
header.status1     =char(fread(fid,16,'char'))';  %User defined and supplied
header.status2     =char(fread(fid,8,'char'))';   %User defined and supplied
header.panwcom      =fread(fid,1,'float32');  % Return from Pan/Tilt if used when compass present
header.tiltwcom     =fread(fid,1,'float32');  % Return from Pan/Tilt if used when compass is present
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
header.sonartilt   =fread(fid,1,'float32');  % Read from compass if used, Read from Pan/Tilt if used and no compass
header.sonarroll   =fread(fid,1,'float32');  % Read from compass if used, Read from Pan/Tilt if used and no compass
header.latitude    =fread(fid,1,'float64');
header.longitude   =fread(fid,1,'float64');
header.sonarposition =fread(fid,1,'float32');
header.configflags =bitand(fread(fid,1,'int32'),3); % bit0: 1=classic, 0=extended windows; bit1: 0=Standard, 1=LR
header.userassigned=fread(fid,828,'char');  %Move pointer to end of frame header of length 1024 bytes
header.length      =ftell(fid)-initialposition; 

header.configflags = 0; % This is a hack...

if (serialnumber < 19)   %Special Case 1
    header.configflags = 1;
end

if (serialnumber == 15)  %Special Case 2
    header.configflags = 3;
end

switch header.configflags % 
case 0
    winlengths=[1.25 2.5 5 10 20 40];      % DIDSON-S, Extended Windows
case 1
    winlengths=[1.125 2.25 4.5 9 18 36];   % DIDSON-S, Classic Windows
case 2
    winlengths=[2.5 5 10 20 40 70];        % DIDSON-LR, Extended Windows
case 3
    winlengths=[2.25 4.5 9 18 36 72];      % DIDSON-LR, Classic Windows
end
if index>6
    warning('Index is wrong. Set manually to 4, eq to 10m. This is a hack!')
    header.windowlength = 10;   % Convert windowlength code to meters
else
    header.windowlength = winlengths(index);   % Convert windowlength code to meters
end

%Windowstart 1 to 31 times 0.75 (lo) or 0.375 (hi) or 0.419 for extended
switch header.configflags
case {1,3}
    header.windowstart = header.windowstart*(0.375 +(resolution == 0)*0.375); %meters for standard or long range DIDSON
case {0,2}
    header.windowstart = header.windowstart*(0.419 +(resolution == 0)*0.419); %meters for extended DIDSON
end


    