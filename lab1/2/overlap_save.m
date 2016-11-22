function y=overlap_save(x,h,seplen)
lx=length(x);
lh=length(h);
if (seplen<lh)  %为划分长度选择一个合适的值，确保结果正确
    seplen=lh+1;
end
L=seplen+lh-1;  %循环卷积的长度
t=zeros(1,lh-1);
T=ceil(lx/seplen); %分段数
x=[x,zeros(1,(T+1)*seplen-lx)]; %不足的地方补零
y=zeros(1,(T+1)*seplen);
for i=0:1:T
    xi=i*seplen+1;
    segx = [t,x(xi:xi+seplen-1)]; %确定分段
    t=segx(seplen+1:seplen+lh-1); %此时，t(n)因为后lh-1个点的值
    segy=circular_conv(segx,h,L); %计算循环卷积
    y(xi:xi+seplen-1)=segy(lh:seplen+lh-1); %后seplen个点的结果是正确的
end
y=y(1:lx+lh-1); %输出结果