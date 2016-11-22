function y=overlap_add(x,h,seplen)
lh=length(h);
if (seplen<lh)    %为划分长度选择合适的值，确保划分长度正确
    seplen=lh+1;
end
L=lh+seplen-1; %循环卷积与线性卷积结果相同时需要进行运算的最少点的个数
lx=length(x);
T=ceil(lx/seplen);  %分段数
t=zeros(1,lh-1);
x=[x,zeros(1,(T+1)*seplen-lx)];  %不够长需要补0
y=zeros(1,(T+1)*seplen);    %生成足够长的输出序列
for i=0:1:T
    xi=i*seplen+1;
    segx = x(xi:xi+seplen-1); %选择此时的分段
    segy = circular_conv(segx,h,L); %计算循环卷积
    segy(1:lh-1)=segy(1:lh-1)+t(1:lh-1); %完成重叠相加
    t(1:lh-1)=segy(seplen+1:L); %此时，t(n)应该为保留的后lh-1个点
    y(xi:xi+seplen-1)=segy(1:seplen); %此时前seplen个点结果是正确的
end
y=y(1:lx+lh-1); %最终的输出序列