# ARISreader
Code for reading Soundmetric ARIS data into matlab

These files will enable you to bring ddf and aris files into MatLab.

The ones you call are:
data=get_frame_first(filename)
	This returns the first frame and information about the frame in the structure data
	Call this routine to open the ddf file


data=get_frame_new(data,framenumber)
	This returns the framenumber specified and updates other items 
	in the data structure as needed.
	Call this after calling "get_frame_first."

data=make_first_image(data,smooth,imagexsize)
Adds image frame to the data structure
Get_frame_first must be called before this function
data = existing data structure formed in get_frame_first.m
smooth = 1,4,or 8.  Generates virtual beams with linear interpolation


data=make_new_image(data,frame_in);
Updates image frame in data structure
This function reads the data structure after get_frame_new has been called
and adds data.image to the structure.
If get_frame_new detects a change in minrange or maxrange, it sets the data.flag to 1


runmovie3
A script that displays a "movie" from ddf file by exercising above functions.
This script requires the variables filename, first, and last be defined. 
See definitions in the script file.

framenew=motion_correction(data,velocity)
	This returns the frame of data found in data.frame with the data placement corrected 
	for forward velocity in meters/s. This is needed when the platform carrying DIDSON 
	moves forward while taking data. It takes up to 8 pings to bring in the needed data. The 
 	original data placement assumes a zero velocity of the platform.
