%This Script runs a simple movie
%variables filename, first, and last must be defined before running script
%filename = string of path and filename
%first=first frame displayed   last = last frame displayed

close all; %Temp line useful for debugging -- closes windows from previous try
load bluebar.mat;
velocity = 0;
data=get_frame_first(filename)

iptsetpref('Imshowborder','tight');
data=make_first_image(data,4,400); %make the first image array
fd = imshow(data.image);colormap(bluebar);
set(gcf,'Position',[873,288,400,575]); 
set(gca,'Clim',[30,200]); %set bottom and top of color map 
set(fd,'EraseMode','none','CDataMapping','scaled');


for framenumber = first:last
    data=get_frame_new(data,framenumber);
    data=make_new_image(data,data.frame);
    set(fd,'CData',data.image);
   % imshow(data.image);colormap(bluebar);
    pause(.001);  %needed to show data!!

end
fclose(data.fid); %Close the ddf file