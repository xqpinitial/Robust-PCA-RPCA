% video_file='VenomSwingIceman_swing_baseball_f_cm_np1_fr_bad_0.avi';
% out_path='run';
function RPCA_video(video_file,out_path,out_path1,out_path2)
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

%%
% 
% t=1/(m*n*channel*Nframe).^(1/3);
% % t2=1/sqrt(m*n*channel);
% [A_hat E_hat iter] = inexact_alm_rpca(D,t);%A_hat�ǵ��ȳɷ֣�E_hat��ϡ�����������������lrsd���н������һ�¡���
% %% ��ʾ
% % show_num=5;%Ҫ����ʾ��ͼ����š�
% % imd=reshape(D(:,show_num),m,n,channel);%�Ѵ�����������Ū�ɾ��󷽱���ʾ��
% % ime=reshape(E_hat(:,show_num),m,n,channel);
% % ima=reshape(A_hat(:,show_num),m,n,channel);
% % subplot(1,3,1);imshow(mat2gray(imd),[]);
% % subplot(1,3,2);imshow(mat2gray(ima),[]);title(strcat('��',int2str(show_num),'��ͼ��RPCA�ֽ���'));
% % subplot(1,3,3);imshow(mat2gray(ime),[]);
% %%
% % �洢Dԭ��������L���ȳɷ־���Sϡ��������;D=L+S;
% A_path=[out_path,'/A_hat/'];
% E_path=[out_path,'/E_hat/'];
% if ~(exist(A_path)&exist(E_path))
%     mkdir(A_path);mkdir(E_path);
% end
% for  k=1:Nframe
%     low_rank=reshape(mat2gray(A_hat(:,k)),m,n,channel);
%     Error=reshape(mat2gray(E_hat(:,k)),m,n,channel);
%     imwrite(low_rank,[A_path,int2str(k),'.jpg'],'jpg');
%     imwrite(Error,[E_path,int2str(k),'.jpg'],'jpg');
% end
%%
% Initialize A,E,Y,u
% while ~converged
%   minimize (inexactly, update A and E only once)
%     L(A,E,Y,u) = |A|_* + lambda * |E|_1 + <Y,D-A-E> + mu/2 * |D-A-E|_F^2;
%   Y = Y + \mu * (D - A - E);
%   \mu = \rho * \mu;
% end
% t=1.25/sqrt(m*n*Nframe*channel);
% % t=1/(m*n*Nframe*channel)^(1/3);
% % t=1/sqrt(m*n*channel);
% [A_hat E_hat iter] = inexact_alm_rpca(D,t);%A_hat�ǵ��ȳɷ֣�E_hat��ϡ�����������������lrsd���н������һ�¡���
% %% ��ʾ
% % show_num=5;%Ҫ����ʾ��ͼ����š�
% % imd=reshape(D(:,show_num),m,n,channel);%�Ѵ�����������Ū�ɾ��󷽱���ʾ��
% % ime=reshape(E_hat(:,show_num),m,n,channel);
% % ima=reshape(A_hat(:,show_num),m,n,channel);
% % subplot(1,3,1);imshow(mat2gray(imd),[]);
% % subplot(1,3,2);imshow(mat2gray(ima),[]);title(strcat('��',int2str(show_num),'��ͼ��RPCA�ֽ���'));
% % subplot(1,3,3);imshow(mat2gray(ime),[]);
% %%
% % �洢Dԭ��������L���ȳɷ־���Sϡ��������;D=L+S;
% A_path=[out_path1,'/A_hat/'];
% E_path=[out_path1,'/E_hat/'];
% D_path=[out_path1,'/D_hat/'];
% if ~(exist(A_path)&exist(E_path)&exist(D_path))
%     mkdir(A_path);mkdir(E_path);mkdir(D_path)
% end
% for  k=1:Nframe
%     low_rank=reshape(mat2gray(A_hat(:,k)),m,n,channel);
%     Error=reshape(mat2gray(E_hat(:,k)),m,n,channel);
%     d=reshape(mat2gray(D(:,k)),m,n,channel);
%     imwrite(low_rank,[A_path,int2str(k),'.jpg'],'jpg');
%     imwrite(Error,[E_path,int2str(k),'.jpg'],'jpg');
%     imwrite(d,[D_path,int2str(k),'.jpg'],'jpg');
% end

% %
t2=1/sqrt(m*n*channel);
% t2=1/sqrt(m*n*channel);
[A_hat E_hat iter] = inexact_alm_rpca(D,t2);%A_hat�ǵ��ȳɷ֣�E_hat��ϡ�����������������lrsd���н������һ�¡���
%% ��ʾ
% show_num=5;%Ҫ����ʾ��ͼ����š�
% imd=reshape(D(:,show_num),m,n,channel);%�Ѵ�����������Ū�ɾ��󷽱���ʾ��
% ime=reshape(E_hat(:,show_num),m,n,channel);
% ima=reshape(A_hat(:,show_num),m,n,channel);
% subplot(1,3,1);imshow(mat2gray(imd),[]);
% subplot(1,3,2);imshow(mat2gray(ima),[]);title(strcat('��',int2str(show_num),'��ͼ��RPCA�ֽ���'));
% subplot(1,3,3);imshow(mat2gray(ime),[]);
%%
% �洢Dԭ��������L���ȳɷ־���Sϡ��������;D=L+S;
A_path=[out_path2,'/A_hat/'];
E_path=[out_path2,'/E_hat/'];
if ~(exist(A_path)&exist(E_path))
    mkdir(A_path);mkdir(E_path);
end
for  k=1:Nframe
    low_rank=reshape(mat2gray(A_hat(:,k)),m,n,channel);
    Error=reshape(mat2gray(E_hat(:,k)),m,n,channel);
    imwrite(low_rank,[A_path,int2str(k),'.jpg'],'jpg');
    imwrite(Error,[E_path,int2str(k),'.jpg'],'jpg');
end




        
   
