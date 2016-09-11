function convert_sonar_to_mat(dataDir, type, file_extension)
disp(dataDir);
%
% dataDir:
% Directory where the respective ddf files are placed
%
% Type:
% type=='A'. Creates avi files
% type=='D'. Creates a matlab file per ddf file
% type=='T'. Creates a time index file

if nargin==1
    type='A';
    file_extension = 'ddf';
elseif nargin == 2
    file_extension = 'ddf';
end

% A function to convert all didson files to mat files.

d = dir(fullfile(dataDir,['*.' file_extension]));

T = [];
for i =1:length(d)
    disp(['File ',num2str(i),' of ',num2str(length(d))])
    if exist(fullfile(dataDir,d(i).name))
        Tsub=cp_ReadAndSaveDidson(fullfile(dataDir, d(i).name),...
            file_extension,type);
    else
        warning(['No data file in ',dataDir, d(i).name])
        Tsub=[];
    end
    T = [T; [Tsub repmat(i,size(Tsub))]];
end
save(fullfile(dataDir,'T.mat'),'T')

function[T] = cp_ReadAndSaveDidson(filename, file_extension,type)
% Deliver the time data vector
matfilename = [filename(1:end-length(file_extension)),'mat'];

% Create data set and store to matlab
data = get_frame_first(filename);
T = NaN([data.numframes 2]);
D = NaN([data.numframes size(data.frame,1) size(data.frame,2)]);
D(1,:,:) = data.frame;
T(1,1) = data.datenum;
T(1,2) = 1;


% In aris we couldn't read the timestamp as data.datenum is alwways 0.
% The solution adopted has been to create a new timestamp considering the
% framerate as time step between frames.
if(strcmp(file_extension,'aris'))
    time_step = (1/double(data.framerate)); % time step between frames in microseconds
    time_index = 0;
    T(1,1) = 0;
end

if type=='D' || type=='T'
    for i = 2:data.numframes %= pari.startframe:pari.endframe
        data=get_frame_new(data,i);
        if(strcmp(file_extension,'aris'))
            time_index = time_index + time_step;
        end
        
        if ~isempty(data.frame)% If the data frame is empty, keep the NaN's
            D(i,:,:) = data.frame;
        end
        if ~isempty(data.datenum)% If the data frame is empty, keep the NaN's
            if(strcmp(file_extension,'aris'))
                T(i,1) = time_index;
            else
                T(i,1) = data.datenum;
            end
        end
        T(i,2)=i;
    end
    
    fclose(data.fid); %Close the ddf file
    data.frame=[];
    data.frame = D;
    
    if type=='D'
        save(matfilename,'D','T');
    end
    
elseif type=='A'
    % Generate avi file
    
    avifilename = [filename(1:end-length(file_extension)),'avi'];
    
    data=get_frame_first(filename);
    iptsetpref('Imshowborder','tight');
    [r c] = size(data.frame);
    %Straight line equation to allow scale images according to the number of samples per beam
    image_width = round(0.1773*r + 309); 
    data=make_first_image(data,4,image_width); %make the first image array
    
    trackflowavi = VideoWriter(avifilename); %,'keyframe',20, 'Quality',100);
    trackflowavi.FrameRate = data.framerate;
    open(trackflowavi)
    for framenumber = 2:data.numframes
        data=get_frame_new(data,framenumber);
        data=make_new_image(data,data.frame);
        %set(fd,'CData',data.image);
       % imagesc(data.image);
        writeVideo(trackflowavi,data.image);
%        trackflowavi = addframe(trackflowavi,getframe(gca));
 %       drawnow;
        
        disp(['Frame ',num2str(framenumber),...
            ' of ',num2str(data.numframes)])
    end
    % Close the files
    fclose(data.fid); %Close the ddf file
    close(trackflowavi);
end
