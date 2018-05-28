 video_file='test_avi/v_TaiChi_g14_c03.avi';
 out_path='run';
out_path1='';
out_path2='';
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
t2=1/sqrt(m*n*channel);
[A_hat E_hat iter] = inexact_alm_rpca(D,t2);%A_hat:low rank£»E_hat:spare¡£
%%
A_path=['A_hat/'];
E_path=['E_hat/'];
D_path=['D_hat/'];
if ~(exist(A_path)&exist(E_path)&exist(D_path))
    mkdir(A_path);mkdir(E_path);mkdir(D_path)
end
for  k=1:Nframe
    low_rank=reshape(mat2gray(A_hat(:,k)),m,n,channel);
    Error=reshape(mat2gray(E_hat(:,k)),m,n,channel);
    d=reshape(mat2gray(D(:,k)),m,n,channel);
    imwrite(low_rank,[A_path,int2str(k),'.bmp'],'bmp');
    imwrite(Error,[E_path,int2str(k),'.bmp'],'bmp');
    imwrite(d,[D_path,int2str(k),'.bmp'],'bmp');
end




        
   
