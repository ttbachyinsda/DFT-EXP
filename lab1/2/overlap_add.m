function y=overlap_add(x,h,seplen)
lh=length(h);
if (seplen<lh)    %Ϊ���ֳ���ѡ����ʵ�ֵ��ȷ�����ֳ�����ȷ
    seplen=lh+1;
end
L=lh+seplen-1; %ѭ����������Ծ�������ͬʱ��Ҫ������������ٵ�ĸ���
lx=length(x);
T=ceil(lx/seplen);  %�ֶ���
t=zeros(1,lh-1);
x=[x,zeros(1,(T+1)*seplen-lx)];  %��������Ҫ��0
y=zeros(1,(T+1)*seplen);    %�����㹻�����������
for i=0:1:T
    xi=i*seplen+1;
    segx = x(xi:xi+seplen-1); %ѡ���ʱ�ķֶ�
    segy = circular_conv(segx,h,L); %����ѭ�����
    segy(1:lh-1)=segy(1:lh-1)+t(1:lh-1); %����ص����
    t(1:lh-1)=segy(seplen+1:L); %��ʱ��t(n)Ӧ��Ϊ�����ĺ�lh-1����
    y(xi:xi+seplen-1)=segy(1:seplen); %��ʱǰseplen����������ȷ��
end
y=y(1:lx+lh-1); %���յ��������