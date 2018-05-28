clc;
clear all;
warning off
maindir = 'hmdb51';
subdir =  dir( maindir );  
result_path= 'rpca/hmdb51_ori_param';
result_path1='rpca/hmdb51_new_param';
result_path2='rpca/hmdb51_max';
for i = 1 : length( subdir )
    if( isequal( subdir( i ).name, '.' ) || ...
        isequal( subdir( i ).name, '..' ) || ...
        ~subdir( i ).isdir )   % 如果不是目录跳过
        continue;
    end
     
    subdirpath = fullfile( maindir, subdir( i ).name, '*.avi' );
    avi_file = dir( subdirpath );   % 在这个子文件夹下找后缀为jpg的文件
     
    % 遍历avi
    for j = 1 : length( avi_file )
        video_file = fullfile( maindir, subdir( i ).name, avi_file( j ).name)
        out_path=fullfile(result_path,subdir( i ).name, avi_file( j ).name(1:end-4));
        out_path1=fullfile(result_path1,subdir( i ).name, avi_file( j ).name(1:end-4));
        out_path2=fullfile(result_path2,subdir( i ).name, avi_file( j ).name(1:end-4));
        tic
        RPCA_video(video_file,out_path,out_path1,out_path2);
        toc
    end
end