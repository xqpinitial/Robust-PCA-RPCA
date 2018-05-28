 video_file='test_avi/v_Archery_g07_c01.avi';
m=256;
n=256;
readerobj=VideoReader(video_file);
vidFrames = read(readerobj);
Nframe = get(readerobj, 'numberOfFrames');
if readerobj.VideoFormat=='RGB24'
    channel=3; 
else
    channel=1;
end
D=imresize(vidFrames,[m,n]);
D=reshape(D,m*n*channel,Nframe);
D=double(D);
% ´æ´¢DÔ­ÏòÁ¿¾ØÕó£¬LµÍÖÈ³É·Ö¾ØÕó£¬SÏ¡ÊèÎó²î¾ØÕó;D=L+S;

D_path=['D_hat/'];
if ~(exist(D_path))
    mkdir(D_path);
end
for  k=1:Nframe
    d=reshape(mat2gray(D(:,k)),m,n,channel);
    imwrite(d,[D_path,int2str(k),'.bmp'],'bmp');
end




        
   
