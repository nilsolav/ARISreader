function header = get_file_header_ddf1(fid)
% get_file_header returns structure with file header components
% File is already opened and fid obtained

winlengths=[1.125 2.25 4.5 9 18 36];

header.numframes=fread(fid,1,'int32');
header.framerate=fread(fid,1,'int32');
header.resolution=fread(fid,1,'int32'); % 0=lo 1 = Hi
header.numbeams=fread(fid,1,'int32'); %48 Lo 96 Hi
header.samplerate=fread(fid,1,'float32');
header.samplesperchannel=fread(fid,1,'int32');
header.receivergain=fread(fid,1,'int32'); %0-40 dB
%Windowstart 1 to 31 times 0.75 (lo) or 0.375 (hi)
header.windowstart = fread(fid,1,'int32')*(0.375 +(header.resolution == 0)*0.375);
%Windowlength coded as 0 to 3 
index=fread(fid,1,'int32') +1 +2*(header.resolution == 0);  %Add 2 if low resolution
header.windowlength= winlengths(index);
header.reverse=fread(fid,1,'int32');
header.serialnumber=fread(fid,1,'int32');
length1=fread(fid,1,'uchar');
header.date=char(fread(fid,length1,'char'))';
length2=fread(fid,1,'uchar');
header.idstring=char(fread(fid,length2,'char'))';
header.length= ftell(fid); %byte offset to the last byte in file header 


