function [T,d]=arisreader_timeindex(dataDir)
% This function reads the *.aris files in a directory and generates index,
% avi or mat files. If the time interval is used, the time index files must
% be generated before running the fucntion
%
% Input
% dataDir: Data directory for the .aris files
%
% output:
% T = [matlabtime pingnumber filenumber]
% d = filename structure referring to filenumber above
%


% File or directories?
dd = exist(dataDir);
if dd~=7
    error('Directory not found')
else
    d = dir(fullfile(dataDir, '*.aris'));
    if isempty(d)
        error('No aris files in the directory')
    end
end    

N = zeros(length(d)+1,1);
for i =1:length(d)
    disp(['File ',num2str(i),' of ',num2str(length(d))])
    Tsub{i}=ReadARISTime(fullfile(dataDir, d(i).name));
    N(i+1) = size(Tsub{i}(:,1),1);
end

T = NaN(sum(N),3);
N=cumsum(N);
for i=1:length(N)-1
    T((N(i)+1):N(i+1),3) = i;
    T((N(i)+1):N(i+1),1:2) = Tsub{i};
end

function[T] = ReadARISTime(filename)
% Read data from aris files
data = get_frame_first(filename);
T = NaN([data.numframes 2]);
% When we can read the time from the files we need to change this
% part of the code:
%T(1,1) = data.datenum;
warning('Time is obtained through file name and ping rate')

T(1,1) = 0;
T(1,2) = 1;
for i = 2:data.numframes %= pari.startframe:pari.endframe
    data=get_frame_new(data,i);
    if ~isempty(data.datenum)% If the data frame is empty, keep the NaN's
        % When we can read the time from the files we need to change this
        % part of the code:
        %T(i,1) = data.datenum;
        T(i,1) = T(i-1,1)+(1/data.framerate);
    end
    T(i,2)=i;
end
% Need to remove this too!
[~,b,~]=fileparts(filename);
T(:,1) = T(:,1)/(24*60*60) + datenum(...
    str2num(b(end-16:end-13)),str2num(b(end-11:end-10)),str2num(b(end-8:end-7)),...
    str2num(b(end-5:end-4)),str2num(b(end-3:end-2)),str2num(b(end-1:end)));
fclose(data.fid); %Close the ddf file
