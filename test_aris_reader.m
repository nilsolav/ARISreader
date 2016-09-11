filename = '/Volumes/Datos/collpen/aris_reader_tests/Calibration_position1_2014-08-26_123031.aris';

% get_frame_first(filename);


fid = fopen(filename,'rb');
fseek(fid,1024,'bof');

frameindex          = fread(fid,1,'uint');
frametime           = fread(fid,1,'uint64');
version             = fread(fid,1,'uint');
status              = fread(fid,1,'uint');
sonartimestamp      = fread(fid,1,'uint64');
tsday               = fread(fid,1,'uint');
tshour              = fread(fid,1,'uint');
tsminute            = fread(fid,1,'uint');
tssecond            = fread(fid,1,'uint');
tshsecond           = fread(fid,1,'uint');
transmitmode        = fread(fid,1,'uint');
windowstart         = fread(fid,1,'float');
windowlength        = fread(fid,1,'float');
threshold           = fread(fid,1,'uint');
intensity           = fread(fid,1,'int');
receivergain        = fread(fid,1,'uint'); % 
degc1               = fread(fid,1,'uint'); % 
degc2               = fread(fid,1,'uint'); % 
humidity            = fread(fid,1,'uint'); % 
focus               = fread(fid,1,'uint'); % 
battery             = fread(fid,1,'uint'); % 
uservalue1          = fread(fid,1,'float'); % 
uservalue2          = fread(fid,1,'float'); % 
uservalue3          = fread(fid,1,'float'); % 
uservalue4          = fread(fid,1,'float'); % 
uservalue5          = fread(fid,1,'float'); % 
uservalue6          = fread(fid,1,'float'); % 
uservalue7          = fread(fid,1,'float'); % 
uservalue8          = fread(fid,1,'float'); % 
velocity            = fread(fid,1,'float'); % Platform velocity from AUV integration
depth               = fread(fid,1,'float'); % Platform depth from AUV integration
altitude            = fread(fid,1,'float'); % Platform altitude from AUV integration
pitch               = fread(fid,1,'float'); % Platform pitch from AUV integration
pitchrate           = fread(fid,1,'float'); % Platform pitch rate from AUV integration
roll                = fread(fid,1,'float'); % Platform roll from AUV integration
rollrate            = fread(fid,1,'float'); % Platform roll rate from AUV integration
heading             = fread(fid,1,'float'); % Platform heading from AUV integration
headingrate         = fread(fid,1,'float'); % Platform heading rate from AUV integration
compassheading      = fread(fid,1,'float'); % Sonar compass heading output
compasspitch        = fread(fid,1,'float'); % Sonar compass pitch output
compassroll         = fread(fid,1,'float'); % Sonar compass roll output
latitude            = fread(fid,1,'double'); % from auxiliary GPS sensor
longitude           = fread(fid,1,'double'); % from auxiliary GPS sensor
sonarposition       = fread(fid,1,'float'); % special for PNNL
configflags         = fread(fid,1,'uint'); % 
beamtilt            = fread(fid,1,'float'); % 
targetrange         = fread(fid,1,'float'); % 
targetbearing       = fread(fid,1,'float'); % 
targetpresent       = fread(fid,1,'uint'); % 
firmwarerevision    = fread(fid,1,'uint'); % 
flags               = fread(fid,1,'uint'); % 
sourceframe         = fread(fid,1,'uint'); % Source file frame number for CSOT output files
watertemp           = fread(fid,1,'float'); % Water temperature from housing temperature sensor
timerperiod         = fread(fid,1,'uint'); % 
sonarx              = fread(fid,1,'float'); % Sonar X location for 3D processing
sonary              = fread(fid,1,'float'); % Sonar Y location for 3D processing
sonarz              = fread(fid,1,'float'); % Sonar Z location for 3D processing
sonarpan            = fread(fid,1,'float'); % X2 pan output
sonartilt           = fread(fid,1,'float'); % X2 tilt output
sonarroll           = fread(fid,1,'float'); % X2 roll output                                                                                                                       **** End of DDF_03 frame header data ****
panpnnl             = fread(fid,1,'float'); % 
tiltpnnl            = fread(fid,1,'float'); % 
rollpnnl            = fread(fid,1,'float'); % 
vehicletime         = fread(fid,1,'double'); % special for Bluefin Robotics HAUV or other AUV integration
timeggk             = fread(fid,1,'float'); % GPS output from NMEA GGK message
dateggk             = fread(fid,1,'uint'); % GPS output from NMEA GGK message
qualityggk          = fread(fid,1,'uint'); % GPS output from NMEA GGK message
numsatsggk          = fread(fid,1,'uint'); % GPS output from NMEA GGK message
dopggk              = fread(fid,1,'float'); % GPS output from NMEA GGK message
ehtggk              = fread(fid,1,'float'); % GPS output from NMEA GGK message
heavetss            = fread(fid,1,'float'); % 
yeargps             = fread(fid,1,'uint'); % GPS year output
monthgps            = fread(fid,1,'uint'); % GPS month output
daygps              = fread(fid,1,'uint'); % GPS day output
hourgps             = fread(fid,1,'uint'); % GPS hour output
minutegps           = fread(fid,1,'uint'); % GPS minute output
secondgps           = fread(fid,1,'uint'); % GPS second output
hsecondgps          = fread(fid,1,'uint'); % GPS 1/100th second output
sonarpanoffset      = fread(fid,1,'float'); % Sonar mount location pan offset for 3D processing
sonartiltoffset     = fread(fid,1,'float'); % Sonar mount location tilt offset for 3D processing
sonarrolloffset     = fread(fid,1,'float'); % Sonar mount location roll offset for 3D processing
sonarxoffset        = fread(fid,1,'float'); % Sonar mount location X offset for 3D processing
sonaryoffset        = fread(fid,1,'float'); % Sonar mount location Y offset for 3D processing
sonarzoffset        = fread(fid,1,'float'); % Sonar mount location Z offset for 3D processing
tmatrix             = fread(fid,16,'float'); % 3D processing transformation matrix                                                                       ****  End of DDF_04 frame header data ****
samplerate          = fread(fid,1,'float'); % Calculated as 1e6/SamplePeriod
accellx             = fread(fid,1,'float'); % X-axis sonar acceleration
accelly             = fread(fid,1,'float'); % Y-axis sonar acceleration
accellz             = fread(fid,1,'float'); % Z-axis sonar acceleration
pingmode            = fread(fid,1,'uint'); % ARIS ping mode [1..12]
frequencyhilow      = fread(fid,1,'uint'); % 1 = HF, 0 = LF
pulsewidth          = fread(fid,1,'uint'); % Width of transmit pulse in usec, [4..100]
cycleperiod         = fread(fid,1,'uint'); % Ping cycle time in usec, [1802..65535]
sampleperiod        = fread(fid,1,'uint'); % Downrange sample rate in usec, [4..100]
transmitenable      = fread(fid,1,'uint'); % 1 = Transmit ON, 0 = Transmit OFF
framerate           = fread(fid,1,'float'); % Instantaneous frame rate between frame N and frame N-1
soundspeed          = fread(fid,1,'float'); % Sound velocity in water calculated from water temperature and salinity setting
samplesperbeam      = fread(fid,1,'uint'); % Number of downrange samples in each beam
enable150v          = fread(fid,1,'uint'); % 1 = 150V ON (Max Power), 0 = 150V OFF (Min Power, 12V)
samplestartdelay    = fread(fid,1,'uint'); % Delay from transmit until start of sampling (window start) in usec, [930..65535]
largelens           = fread(fid,1,'uint'); % 1 = telephoto lens (large lens, big lens, hi-res lens) present
thesystemtype       = fread(fid,1,'uint'); % 1 = ARIS 3000, 0 = ARIS 1800, 2 = ARIS 1200
sonarserialnumber   = fread(fid,1,'uint'); % Sonar serial number as labeled on housing
encryptedkey        = fread(fid,1,'uint64'); % Reserved for future use
ariserrorflagsuint  = fread(fid,1,'uint'); % Error flag code bits
missedpackets       = fread(fid,1,'uint'); % Missed packet count for Ethernet statistics reporting
arisappversion      = fread(fid,1,'uint'); % Version number of ArisApp sending frame data
available2          = fread(fid,1,'uint'); % Reserved for future use
reorderedsamples    = fread(fid,1,'uint'); % 1 = frame data already ordered into [beam,sample] array, 0 = needs reordering
salinity            = fread(fid,1,'uint'); % Water salinity code:  0 = fresh, 15 = brackish, 35 = salt
pressure            = fread(fid,1,'float'); % Depth sensor output in meters
batteryvoltage      = fread(fid,1,'float'); % Battery input voltage before power steering
mainvoltage         = fread(fid,1,'float'); % Main cable input voltage before power steering
switchvoltage       = fread(fid,1,'float'); % Input voltage after power steering
focusmotormoving    = fread(fid,1,'uint'); % Added 14-Aug-2012 for AutomaticRecording
voltagechanging     = fread(fid,1,'uint'); % Added 16-Aug (first two bits = 12V, second two bits = 150V, 00 = not changing, 01 = turning on, 10 = turning off)
focustimeoutfault   = fread(fid,1,'uint'); % 
focusovercurrentfault = fread(fid,1,'uint'); % 
focusnotfoundfault  = fread(fid,1,'uint'); % 
focusstalledfault   = fread(fid,1,'uint'); % 
fpgatimeoutfault    = fread(fid,1,'uint'); % 
fpgabusyfault       = fread(fid,1,'uint'); % 
fpgastuckfault      = fread(fid,1,'uint'); % 
cputempfault        = fread(fid,1,'uint'); % 
psutempfault        = fread(fid,1,'uint'); % 
watertempfault      = fread(fid,1,'uint'); % 
humidityfault       = fread(fid,1,'uint'); % 
pressurefault       = fread(fid,1,'uint'); % 
voltagereadfault    = fread(fid,1,'uint'); % 
voltagewritefault   = fread(fid,1,'uint'); % 
focuscurrentposition = fread(fid,1,'uint'); % Focus shaft current position in motor units [0?1000]
targetpan           = fread(fid,1,'float'); % Commanded pan position
targettilt          = fread(fid,1,'float'); % Commanded tilt position
targetroll          = fread(fid,1,'float'); % Commanded roll position
panmotorerrorcode   = fread(fid,1,'uint'); % 
tiltmotorerrorcode  = fread(fid,1,'uint'); % 
rollmotorerrorcode  = fread(fid,1,'uint'); % 
panabsposition      = fread(fid,1,'float'); % Low-resolution magnetic encoder absolute pan position
tiltabsposition     = fread(fid,1,'float'); % Low-resolution magnetic encoder absolute tilt position
rollabsposition     = fread(fid,1,'float'); % Low-resolution magnetic encoder absolute roll position
panaccelx           = fread(fid,1,'float'); % Accelerometer outputs from AR2 CPU board sensor
panaccely           = fread(fid,1,'float'); % .
panaccelz           = fread(fid,1,'float'); % .
tiltaccelx          = fread(fid,1,'float'); % .
tiltaccely          = fread(fid,1,'float'); % .
tiltaccelz          = fread(fid,1,'float'); % .
rollaccelx          = fread(fid,1,'float'); % .
rollaccely          = fread(fid,1,'float'); % .
rollaccelz          = fread(fid,1,'float'); % .
appliedsettings     = fread(fid,1,'uint'); % Cookie indices for command acknowlege in frame header
constrainedsettings = fread(fid,1,'uint'); % .
invalidsettings     = fread(fid,1,'uint'); % .
enableinterpacketdelay = fread(fid,1,'uint'); % If true delay is added between sending out image data packets
interpacketdelayperiod = fread(fid,1,'uint'); % packet delay factor in us (does not include function overhead time)
uptime              = fread(fid,1,'uint'); % Total number of seconds sonar has been running
arisappversionmajor = fread(fid,1,'uint16'); % Major version number
arisappversionminor = fread(fid,1,'uint16'); % Minor version number 
gotime              = fread(fid,1,'uint64'); % Sonar time when frame cycle is initiated in hardware
panvelocity         = fread(fid,1,'float'); % AR2 pan velocity in degrees/second
tiltvelocity        = fread(fid,1,'float'); % AR2 tilt velocity in degrees/second
rollvelocity        = fread(fid,1,'float'); % AR2 roll velocity in degrees/second
sentinel            = fread(fid,1,'uint'); % Used to measure the frame header size

% str = char(fread(fid,3,'char'));
% disp(str);
% version=fread(fid,1,'uint8'); %get version number
% disp(version);
%
% frames = fread(fid,1,'uint');
% disp(frames(:));
%
% framerate = fread(fid,1,'uint');
% disp(framerate);
%
% highresolution = fread(fid,1,'uint');
% disp(highresolution);
%
% numbeams = fread(fid,1,'uint');
% disp(numbeams);
%
% samplerate = fread(fid,1,'float');
% disp(samplerate);
%
% sampleperchannel = fread(fid,1,'uint');
% disp(sampleperchannel);
%
% receivergain = fread(fid,1,'uint');
% disp(receivergain);
%
% windowstart = fread(fid,1,'float');
% disp(windowstart);
%
% windowlength = fread(fid,1,'float');
% disp(windowlength);
%
% reverse = fread(fid,1,'uint');
% disp(reverse);
%
% sn = fread(fid,1,'uint');
% disp(sn);
%
% strdate = dec2hex(fread(fid,32,'char'));
% disp(strdate);
% disp('change');
%
% idstring = dec2hex(fread(fid,256,'char')); %User supplied identification notes
% disp(idstring);
%
% id1 = fread(fid,1,'int32'); %four user supplied integers
% id2 = fread(fid,1,'int32');
% id3 = fread(fid,1,'int32');
% id4 = fread(fid,1,'int32');
%
% startframe = fread(fid,1,'uint'); %used if this is a snippet file from source file
% disp(startframe);
%
% endframe = fread(fid,1,'uint'); %Used if this is a snippet file from source file
% disp(endframe);
%
% timelapse = fread(fid,1,'uint'); %Logic 0 or 1 (1 = timelapse active);
% disp(timelapse);
%
% recordInterval = fread(fid,1,'uint'); %Ask Bill
% disp(recordInterval);
%
% radioseconds = fread(fid,1,'uint'); % Needed for timelapse -- ask Bill
% disp(radioseconds);
%
% frameinterval= fread(fid,1,'uint'); % Interval between frames in time lapse
% disp(frameinterval);
%
% flags= fread(fid,1,'uint'); % Interval between frames in time lapse
% disp(flags);
%
% auxflags= fread(fid,1,'uint'); % Interval between frames in time lapse
% disp(auxflags);
%
% sspd= fread(fid,1,'uint'); % Interval between frames in time lapse
% disp(sspd);
%
% flags3d= fread(fid,1,'uint'); % Interval between frames in time lapse
% disp(flags3d);
%
% softwareversion= fread(fid,1,'uint'); % Interval between frames in time lapse
% disp(softwareversion);
%
% watertemperature= fread(fid,1,'uint'); % Interval between frames in time lapse
% disp(watertemperature);
%
% salinity= fread(fid,1,'uint'); % Interval between frames in time lapse
% disp(salinity);
%
% pulselength= fread(fid,1,'uint'); % Interval between frames in time lapse
% disp(pulselength);
%
% txmode= fread(fid,1,'uint'); % Interval between frames in time lapse
% disp(txmode);
%
% versionfgpa= fread(fid,1,'uint'); % Interval between frames in time lapse
% disp(versionfgpa);
%
% versionpsuc= fread(fid,1,'uint'); % Interval between frames in time lapse
% disp(versionpsuc);
%
% thumbnailfi= fread(fid,1,'uint'); % Interval between frames in time lapse
% disp(thumbnailfi);
%
% filesize= fread(fid,1,'uint64'); % Interval between frames in time lapse
% disp(filesize);
%
% optionalheadersize= fread(fid,1,'uint64'); % Interval between frames in time lapse
% disp(optionalheadersize);
%
% optionaltailsize= fread(fid,1,'uint64'); % Interval between frames in time lapse
% disp(optionaltailsize);
%
% versionminor= fread(fid,1,'uint'); % Interval between frames in time lapse
% disp(versionminor);
%
% largelens= fread(fid,1,'uint'); % Interval between frames in time lapse
% disp(largelens);
%
% % userassigned = fread(fid,136,'char'); %User assigned space
 length= ftell(fid); %byte offset to the last byte in file header
% disp(length);
%
 fclose(fid);