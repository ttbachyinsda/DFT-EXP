function X=mygo(x,k)
%��goertzel�㷨�������Ϊk��DFT����
N=length(x);x1=[x,0]; %���г���+1
d1=2*cos(2*pi*k/N);  %��������˲������м���ϵ��
v=filter(1,[1,-d1,1],x1);%���˲�����ʵ�־��
w=exp(-1i*2*pi*k/N); %��w
X=v(N+1)-w*v(N); %�����k��DFT����