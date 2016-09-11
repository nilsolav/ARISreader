function header = get_frame_header_ARIS(fid,resolution,serialnumber)
%get_frame_header_ddf2 returns structure with frame header components
% File is already opened and fid obtained
% resolution (frequency mode) Lo = 0  Hi = 1
% serialnumber = serial number of sonar providing this data

fseek(fid,1024,'bof');
initialposition = ftell(fid); %get initial position of file pointer
header.framenumber          = fread(fid,1,'uint');
header.frametime           = fread(fid,1,'uint64'); % Recording timestamp
header.frametime = floor(header.frametime/1000);	% Correcting padding
header.version             = fread(fid,1,'uint');
header.status              = fread(fid,1,'uint');
header.sonartimestamp      = fread(fid,1,'uint64');
header.tsday               = fread(fid,1,'uint');
header.tshour              = fread(fid,1,'uint');
header.tsminute            = fread(fid,1,'uint');
header.tssecond            = fread(fid,1,'uint');
header.tshsecond           = fread(fid,1,'uint');
header.transmitmode        = fread(fid,1,'uint');
header.windowstart         = fread(fid,1,'float');
header.windowlength        = fread(fid,1,'float');
header.threshold           = fread(fid,1,'uint');
header.intensity           = fread(fid,1,'int');
header.receivergain        = fread(fid,1,'uint'); 
header.degc1               = fread(fid,1,'uint'); 
header.degc2               = fread(fid,1,'uint'); 
header.humidity            = fread(fid,1,'uint'); 
header.focus               = fread(fid,1,'uint'); 
header.battery             = fread(fid,1,'uint'); 
header.uservalue1          = fread(fid,1,'float'); 
header.uservalue2          = fread(fid,1,'float'); 
header.uservalue3          = fread(fid,1,'float'); 
header.uservalue4          = fread(fid,1,'float'); 
header.uservalue5          = fread(fid,1,'float'); 
header.uservalue6          = fread(fid,1,'float'); 
header.uservalue7          = fread(fid,1,'float'); 
header.uservalue8          = fread(fid,1,'float'); 
header.velocity            = fread(fid,1,'float'); 
header.depth               = fread(fid,1,'float'); 
header.altitude            = fread(fid,1,'float'); 
header.pitch               = fread(fid,1,'float'); 
header.pitchrate           = fread(fid,1,'float'); 
header.roll                = fread(fid,1,'float'); 
header.rollrate            = fread(fid,1,'float'); 
header.heading             = fread(fid,1,'float'); 
header.headingrate         = fread(fid,1,'float'); 
header.compassheading      = fread(fid,1,'float'); 
header.compasspitch        = fread(fid,1,'float'); 
header.compassroll         = fread(fid,1,'float'); 
header.latitude            = fread(fid,1,'double'); 
header.longitude           = fread(fid,1,'double'); 
header.sonarposition       = fread(fid,1,'float'); 
header.configflags         = fread(fid,1,'uint'); 
header.beamtilt            = fread(fid,1,'float'); 
header.targetrange         = fread(fid,1,'float'); 
header.targetbearing       = fread(fid,1,'float'); 
header.targetpresent       = fread(fid,1,'uint'); 
header.firmwarerevision    = fread(fid,1,'uint'); 
header.flags               = fread(fid,1,'uint'); 
header.sourceframe         = fread(fid,1,'uint'); 
header.watertemp           = fread(fid,1,'float'); 
header.timerperiod         = fread(fid,1,'uint'); 
header.sonarx              = fread(fid,1,'float'); 
header.sonary              = fread(fid,1,'float'); 
header.sonarz              = fread(fid,1,'float'); 
header.sonarpan            = fread(fid,1,'float'); 
header.sonartilt           = fread(fid,1,'float'); 
header.sonarroll           = fread(fid,1,'float'); 
header.panpnnl             = fread(fid,1,'float'); 
header.tiltpnnl            = fread(fid,1,'float'); 
header.rollpnnl            = fread(fid,1,'float'); 
header.vehicletime         = fread(fid,1,'double'); 
header.timeggk             = fread(fid,1,'float'); 
header.dateggk             = fread(fid,1,'uint'); 
header.qualityggk          = fread(fid,1,'uint'); 
header.numsatsggk          = fread(fid,1,'uint'); 
header.dopggk              = fread(fid,1,'float'); 
header.ehtggk              = fread(fid,1,'float'); 
header.heavetss            = fread(fid,1,'float'); 
header.yeargps             = fread(fid,1,'uint'); 
header.monthgps            = fread(fid,1,'uint'); 
header.daygps              = fread(fid,1,'uint'); 
header.hourgps             = fread(fid,1,'uint'); 
header.minutegps           = fread(fid,1,'uint'); 
header.secondgps           = fread(fid,1,'uint'); 
header.hsecondgps          = fread(fid,1,'uint'); 
header.sonarpanoffset      = fread(fid,1,'float'); 
header.sonartiltoffset     = fread(fid,1,'float'); 
header.sonarrolloffset     = fread(fid,1,'float'); 
header.sonarxoffset        = fread(fid,1,'float'); 
header.sonaryoffset        = fread(fid,1,'float'); 
header.sonarzoffset        = fread(fid,1,'float'); 
header.tmatrix             = fread(fid,16,'float'); 
header.samplerate          = fread(fid,1,'float'); 
header.accellx             = fread(fid,1,'float'); 
header.accelly             = fread(fid,1,'float'); 
header.accellz             = fread(fid,1,'float'); 
header.pingmode            = fread(fid,1,'uint'); 
header.frequencyhilow      = fread(fid,1,'uint'); 
header.pulsewidth          = fread(fid,1,'uint'); 
header.cycleperiod         = fread(fid,1,'uint'); 
header.sampleperiod        = fread(fid,1,'uint'); 
header.transmitenable      = fread(fid,1,'uint'); 
header.framerate           = fread(fid,1,'float'); 
header.soundspeed          = fread(fid,1,'float'); 
header.samplesperbeam      = fread(fid,1,'uint'); 
header.enable150v          = fread(fid,1,'uint'); 
header.samplestartdelay    = fread(fid,1,'uint'); 
header.largelens           = fread(fid,1,'uint'); 
header.thesystemtype       = fread(fid,1,'uint'); 
header.sonarserialnumber   = fread(fid,1,'uint'); 
header.encryptedkey        = fread(fid,1,'uint64'); 
header.ariserrorflagsuint  = fread(fid,1,'uint'); 
header.missedpackets       = fread(fid,1,'uint'); 
header.arisappversion      = fread(fid,1,'uint'); 
header.available2          = fread(fid,1,'uint'); 
header.reorderedsamples    = fread(fid,1,'uint'); 
header.salinity            = fread(fid,1,'uint'); 
header.pressure            = fread(fid,1,'float'); 
header.batteryvoltage      = fread(fid,1,'float'); 
header.mainvoltage         = fread(fid,1,'float'); 
header.switchvoltage       = fread(fid,1,'float'); 
header.focusmotormoving    = fread(fid,1,'uint'); 
header.voltagechanging     = fread(fid,1,'uint'); 
header.focustimeoutfault   = fread(fid,1,'uint'); 
header.focusovercurrentfault = fread(fid,1,'uint'); 
header.focusnotfoundfault  = fread(fid,1,'uint'); 
header.focusstalledfault   = fread(fid,1,'uint'); 
header.fpgatimeoutfault    = fread(fid,1,'uint'); 
header.fpgabusyfault       = fread(fid,1,'uint'); 
header.fpgastuckfault      = fread(fid,1,'uint'); 
header.cputempfault        = fread(fid,1,'uint'); 
header.psutempfault        = fread(fid,1,'uint'); 
header.watertempfault      = fread(fid,1,'uint'); 
header.humidityfault       = fread(fid,1,'uint'); 
header.pressurefault       = fread(fid,1,'uint'); 
header.voltagereadfault    = fread(fid,1,'uint'); 
header.voltagewritefault   = fread(fid,1,'uint'); 
header.focuscurrentposition = fread(fid,1,'uint'); 
header.targetpan           = fread(fid,1,'float'); 
header.targettilt          = fread(fid,1,'float'); 
header.targetroll          = fread(fid,1,'float'); 
header.panmotorerrorcode   = fread(fid,1,'uint'); 
header.tiltmotorerrorcode  = fread(fid,1,'uint'); 
header.rollmotorerrorcode  = fread(fid,1,'uint'); 
header.panabsposition      = fread(fid,1,'float'); 
header.tiltabsposition     = fread(fid,1,'float'); 
header.rollabsposition     = fread(fid,1,'float'); 
header.panaccelx           = fread(fid,1,'float'); 
header.panaccely           = fread(fid,1,'float'); 
header.panaccelz           = fread(fid,1,'float'); 
header.tiltaccelx          = fread(fid,1,'float'); 
header.tiltaccely          = fread(fid,1,'float'); 
header.tiltaccelz          = fread(fid,1,'float'); 
header.rollaccelx          = fread(fid,1,'float'); 
header.rollaccely          = fread(fid,1,'float'); 
header.rollaccelz          = fread(fid,1,'float'); 
header.appliedsettings     = fread(fid,1,'uint'); 
header.constrainedsettings = fread(fid,1,'uint'); 
header.invalidsettings     = fread(fid,1,'uint'); 
header.enableinterpacketdelay = fread(fid,1,'uint'); 
header.interpacketdelayperiod = fread(fid,1,'uint'); 
header.uptime              = fread(fid,1,'uint'); 
header.arisappversionmajor = fread(fid,1,'uint16'); 
header.arisappversionminor = fread(fid,1,'uint16'); 
header.gotime              = fread(fid,1,'uint64'); 
header.panvelocity         = fread(fid,1,'float'); 
header.tiltvelocity        = fread(fid,1,'float'); 
header.rollvelocity        = fread(fid,1,'float'); 
header.sentinel            = fread(fid,1,'uint'); 
header.userassigned=fread(fid,292,'char');  %Free space for user
header.length      =ftell(fid)-initialposition; 

if (serialnumber < 19)   %Special Case 1
    header.configflags = 1;
end

if (serialnumber == 15)  %Special Case 2
    header.configflags = 3;
end

%warning('Hack in didson reader to make things work')
%switch header.configflags % 
%case 0
%    winlengths=[0.83 2.5 5 10 20 40];      % DIDSON-S, Extended Windows
% case 1
%     winlengths=[1.125 2.25 4.5 9 18 36];   % DIDSON-S, Classic Windows
% case 2
%     winlengths=[2.5 5 10 20 40 70];        % DIDSON-LR, Extended Windows
% case 3
%     winlengths=[2.25 4.5 9 18 36 72];      % DIDSON-LR, Classic Windows
%end


% %Windowlength index determined. Windowlength determined at end of file.
% index=fread(fid,1,'int32') +1 +2*(resolution == 0);  %Add 2 if low resolution (index between 1 and 6)
% 

%header.windowlength = winlengths(index);   % Convert windowlength code to meters

%Windowstart 1 to 31 times 0.75 (lo) or 0.375 (hi) or 0.419 for extended
% switch header.configflags
% case {1,3}
%     header.windowstart = header.windowstart*(0.375 +(resolution == 0)*0.375); %meters for standard or long range DIDSON
% case {0,2}
%     header.windowstart = header.windowstart*(0.419 +(resolution == 0)*0.419); %meters for extended DIDSON
% end

end
    