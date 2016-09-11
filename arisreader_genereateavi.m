function arisreader_genereateavi(filein,fileout,type,index)
% This function reads the *.aris files in a directory and generates 
% avi or mat files. If the time index is used a subset is generated based 
% on ping numbers  
%
% input:
% filein: ARIs files
% fileout: 'mat' or 'avi' file without file extension
% type: 'polar','cartesian', or 'mat'
% index: ping index file ['index from' 'index to']
%
% output: 


data=get_frame_first(filein);

if nargin<4
    index=[1 data.numframes];
    L = index(end)-index(1)+1;
end

% Generate output files
avifilename = fileout;
if strcmp(type,'polar')
    vidObj = VideoWriter(fileout,'Uncompressed AVI');
    open(vidObj);
    typen=1;
elseif strcmp(type,'cartesian')
    vidObj = VideoWriter(fileout,'Uncompressed AVI');
    open(vidObj);
    typen=2;
elseif strcmp(type,'mat')
    m = matfile([fileout,'.mat'],'Writable',true);
    m.frame=zeros([size(data.frame,1) size(data.frame,2) L],'uint8');
    data2=data;
    rmfield(data2,'frame')
    m.header=data2;
    typen=3;
end


iptsetpref('Imshowborder','tight');
colormap bone;%(bluebar);
set(gca,'Clim',[30,200]); %set bottom and top of color map

k=1;
for i=index(1):index(2)
    if i~=1
        data=get_frame_new(data,i);
    end
    
    if typen==1
        if k==1
            fd = imshow(data.frame);
            %set(fd,'EraseMode','none','CDataMapping','scaled');
            set(fd,'CDataMapping','scaled');
        else
            set(fd,'CData',data.frame);
        end
        currFrame = getframe(gca);
        writeVideo(vidObj,currFrame);
    elseif typen==2
        % Run this part at the first iteration to set up the images
        if k==1
            data=make_first_image(data,4,400); %make the first image array
            fd = imshow(data.image);
            %set(fd,'EraseMode','none','CDataMapping','scaled');
            set(fd,'CDataMapping','scaled');
        else
            data=make_new_image(data,data.frame);
            set(fd,'CData',data.image);
        end
        currFrame = getframe(gca);
        writeVideo(vidObj,currFrame);
    elseif typen==3
        m.frame(:,:,k)=data.frame;
    end
    k=k+1;
end

% Close the files
fclose(data.fid); %Close the ddf file
close(vidObj);
