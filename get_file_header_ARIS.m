function header = get_file_header_ARIS(fid)

% get_file_header returns structure with file header components
% File is already opened and fid obtained
header.numframes = fread(fid,1,'uint'); %Total frames in file
header.framerate = fread(fid,1,'uint'); %Initial recorded frame rate
header.resolution = fread(fid,1,'uint'); %Non-zero if HF, zero if LF
header.numbeams = fread(fid,1,'uint'); %ARIS 3000 = 128/64, ARIS 1800 = 96/48, ARIS 1200 = 48
header.samplerate = fread(fid,1,'float'); %1/Sample Period
header.sampleperchannel = fread(fid,1,'uint'); %Number of range samples in each beam
header.receivergain = fread(fid,1,'uint'); %Relative gain in dB:  0 - 40
header.windowstart = fread(fid,1,'float'); %Image window start range in meters (code [0..31] in DIDSON)
header.windowlength = fread(fid,1,'float'); %Image window length in meters  (code [0..3] in DIDSON)
header.reverse = fread(fid,1,'uint'); %Non-zero = lens down (DIDSON) or lens up (ARIS), zero = opposite
header.serialnumber = fread(fid,1,'uint'); %Sonar serial number
header.strdate = dec2hex(fread(fid,32,'char')); %Date that file was recorded
header.idstring = dec2hex(fread(fid,256,'char'));  %User input to identify file in 256 characters
header.id1 = fread(fid,1,'int32');  %User-defined integer quantity
header.id2 = fread(fid,1,'int32'); %User-defined integer quantity
header.id3 = fread(fid,1,'int32'); %User-defined integer quantity
header.id4 = fread(fid,1,'int32'); %User-defined integer quantity
header.startframe = fread(fid,1,'uint');  %First frame number from source file (for DIDSON snippet files)
header.endframe = fread(fid,1,'uint');  %Last frame number from source file (for DIDSON snippet files)
header.timelapse = fread(fid,1,'uint');  %Non-zero indicates time lapse recording
header.recordInterval = fread(fid,1,'uint');  %Number of frames/seconds between recorded frames
header.radioseconds = fread(fid,1,'uint');  %Frames or seconds interval
header.frameinterval= fread(fid,1,'uint');  %Record every Nth frame
header.flags= fread(fid,1,'uint');  %See DDF_04 file format document
header.auxflags= fread(fid,1,'uint');  %See DDF_04 file format document
header.sspd= fread(fid,1,'uint');  %Sound velocity in water
header.flags3d= fread(fid,1,'uint');  %See DDF_04 file format document
header.softwareversion= fread(fid,1,'uint');  %DIDSON software version that recorded the file
header.watertemperature= fread(fid,1,'uint');  %Water temperature code:  0 = 5-15C, 1 = 15-25C, 2 = 25-35C
header.salinity= fread(fid,1,'uint');  %Salinity code:  0 = fresh, 1 = brackish, 2 = salt
header.pulselength= fread(fid,1,'uint');  %Added for ARIS but not used
header.txmode= fread(fid,1,'uint');  %Added for ARIS but not used
header.versionfgpa= fread(fid,1,'uint');  %Reserved for future use
header.versionpsuc= fread(fid,1,'uint');  %Reserved for future use
header.thumbnailfi= fread(fid,1,'uint');  %Frame index of frame used for thumbnail image of file
header.filesize= fread(fid,1,'uint64');  %Total file size in bytes
header.optionalheadersize= fread(fid,1,'uint64');  %Reserved for future use
header.optionaltailsize= fread(fid,1,'uint64');  %Reserved for future use
header.versionminor= fread(fid,1,'uint');  %DIDSON_ADJUSTED_VERSION_MINOR
header.largelens= fread(fid,1,'uint');  %Non-zero if telephoto lens (large lens, hi-res lens, big lens) is present
header.userassigned=fread(fid,568,'char');  %Free space for user
header.length= ftell(fid);  %Lenght of header file
end