function X=mygo(x,k)
%用goertzel算法计算序号为k的DFT样本
N=length(x);x1=[x,0]; %序列长度+1
d1=2*cos(2*pi*k/N);  %求出二阶滤波环节中间项系数
v=filter(1,[1,-d1,1],x1);%用滤波函数实现卷积
w=exp(-1i*2*pi*k/N); %求w
X=v(N+1)-w*v(N); %求出第k个DFT样本