function header = get_file_header_ddf2(fid)
% get_file_header returns structure with file header components
% File is already opened and fid obtained
winlengths=[1.125 2.25 4.5 9 18 36];

header.numframes=fread(fid,1,'int32');
header.framerate=fread(fid,1,'int32');
header.resolution=fread(fid,1,'int32'); % 0=lo 1 = Hi
header.numbeams=fread(fid,1,'int32'); %48 Lo 96 Hi  This can give wrong value
header.numbeams=48 + 48*(header.resolution == 1)
header.samplerate=fread(fid,1,'float32');
header.samplesperchannel=fread(fid,1,'int32');
header.receivergain=fread(fid,1,'int32'); %0-40 dB
%Windowstart 1 to 31 times 0.75 (lo) or 0.375 (hi)
header.windowstart = fread(fid,1,'int32')*(0.375 +(header.resolution == 0)*0.375); %meters
%Windowlength coded as 0 to 3 
index=fread(fid,1,'int32') +1 +2*(header.resolution == 0);  %Add 2 if low resolution
header.windowlength= winlengths(index); %meters
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
header.userassigned = fread(fid,152,'char'); %User assigned space
header.length= ftell(fid); %byte offset to the last byte in file header 


