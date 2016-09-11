function data=get_frame_new(data,framenumber);
% gets specified frame of data from DIDSON Data File
% data = output structure from "get_first_frame" m-file
% framenumber = scalar number of the frame desired in the file


datalength = data.sampleperchannel*data.numbeams;
numbytes= data.fileheaderlength + (framenumber -1)*...
    (data.frameheaderlength + datalength);
status=fseek(data.fid,numbytes,'bof');
resolution=(data.numbeams-48)/96;
switch data.version
    case 0
        header=get_frame_header_ddf01(data.fid,resolution);
    case 1
        header=get_frame_header_ddf01(data.fid,resolution);
    case 2
        header=get_frame_header_ddf2(data.fid,resolution);
    case 3
        header=get_frame_header_ddf3(data.fid,resolution,data.serialnumber);
    case 4
        header=get_frame_header_ddf4(data.fid,resolution,data.serialnumber);
    case 5
        % Resolution is not necessary here, kept just to follow the DIDSON
        % format (to be eliminate in further versions)
        header=get_frame_header_ARIS(data.fid,resolution,data.serialnumber);
    otherwise
        fprintf ('Illegal version number is %d\n', version);
        return
end

maxirange = header.windowstart + header.windowlength;
if (header.windowstart ~= data.minrange) || (maxirange ~= data.maxrange)
    data.minrange = header.windowstart;
    data.maxrange = maxirange;
    data.flag =1; %set data flag to alert other programs that the ranges have changed.
end

frame=uint8(fread(data.fid,[data.numbeams,data.sampleperchannel],...
    'uint8')); % 512 for DIDSON, data.numbeams*data.sampleperchannel for ARIS

if data.reverse == 0
    frame=fliplr(frame'); %Transposed and flipped data frame assumes uninverted sonar
else
    frame=frame'; % Assume inverted sonar
end
data.frame=frame;

if(data.version==5) %ARIS file format
    try
        % Date is not correctly read from the ARIS file though this should
        % not be a problem for rendering the videos
        data.datenum = datenum(header.yeargps,header.monthgps,header.daygps,...
            header.hourgps,header.minutegps,header.secondgps+header.hsecondgps/100);
    catch
        data.datenum = NaN;
    end
    data.framerate = header.framerate;
else
    data.datenum =datenum(header.year,header.month,header.day,header.hour,...
        header.minute,header.second+header.hsecond/100);
end
end
