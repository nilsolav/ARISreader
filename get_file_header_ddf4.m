function header = get_file_header_ddf4(fid)
% get_file_header returns structure with file header components
% File is already opened and fid obtained

header.numframes=fread(fid,1,'int32');
header.framerate=fread(fid,1,'int32');
header.resolution=fread(fid,1,'int32'); % 0=lo 1 = Hi
header.numbeams=fread(fid,1,'int32'); %48 Lo 96 Hi for standard mode
header.samplerate=fread(fid,1,'float32');
header.samplesperchannel=fread(fid,1,'int32');
header.receivergain=fread(fid,1,'int32'); %0-40 dB

header.windowstart = fread(fid,1,'int32');  %Windowstart 1 to 31 

header.windowlength =fread(fid,1,'int32'); %Windowlength coded as 0 to 3 

header.reverse=fread(fid,1,'int32');
header.serialnumber=fread(fid,1,'int32');
header.date = fread(fid,32,'char'); %date file was made
header.idstring = fread(fid,256,'char'); %User supplied identification notes
header.id1 = fread(fid,1,'int32'); %four user supplied integers
header.id2 = fread(fid,1,'int32');
header.id3 = fread(fid,1,'int32');
header.id4 = fread(fid,1,'int32');
header.startframe = fread(fid,1,'int32'); %used if this is a snippet file from source file
header.endframe = fread(fid,1,'int32'); %Used if this is a snippet file from source file
header.timelapse = fread(fid,1,'int32'); %Logic 0 or 1 (1 = timelapse active);
header.recordInterval = fread(fid,1,'int32'); %Ask Bill
header.radioseconds = fread(fid,1,'int32'); % Needed for timelapse -- ask Bill
header.frameinterval= fread(fid,1,'int32'); % Interval between frames in time lapse
header.userassigned = fread(fid,648,'char'); %Advance pointer to byte 512 for ddf-4
header.length= ftell(fid); %byte offset to the last byte in file header 
