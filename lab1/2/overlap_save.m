function y=overlap_save(x,h,seplen)
lx=length(x);
lh=length(h);
if (seplen<lh)  %Ϊ���ֳ���ѡ��һ�����ʵ�ֵ��ȷ�������ȷ
    seplen=lh+1;
end
L=seplen+lh-1;  %ѭ������ĳ���
t=zeros(1,lh-1);
T=ceil(lx/seplen); %�ֶ���
x=[x,zeros(1,(T+1)*seplen-lx)]; %����ĵط�����
y=zeros(1,(T+1)*seplen);
for i=0:1:T
    xi=i*seplen+1;
    segx = [t,x(xi:xi+seplen-1)]; %ȷ���ֶ�
    t=segx(seplen+1:seplen+lh-1); %��ʱ��t(n)��Ϊ��lh-1�����ֵ
    segy=circular_conv(segx,h,L); %����ѭ�����
    y(xi:xi+seplen-1)=segy(lh:seplen+lh-1); %��seplen����Ľ������ȷ��
end
y=y(1:lx+lh-1); %������