% Script to run the ARIS reader
%
% 'folder_to_process' indicates the folder containing the source videos.
%
% 'type' indicates the output: 
%    type=='A'. Creates avi files
%    type=='D'. Creates a matlab file per ddf file
%    type=='T'. Creates a time index file (for ARIS the index starts in t=0 
%               and increments the timestamp according to the framerate)
%
% 'extension' indicates the kind of sonar files to be processed
%   extension = 'aris'. ARIS sonar files
%   extension = 'ddf'. DIDSON sonar files
%
% If you find any issue please contact me: 
%   Jose Carlos Castillo (jccmontoya@gmail.com)
folder_to_process = 'C:\collpen_jc\test';
%folder_to_process = '/Volumes/Datos/collpen/aris_reader_tests/';
type = 'A';
extension = 'aris'; 

convert_sonar_to_mat(folder_to_process,type,extension);