x=rand(20,1);
y=rand(500,1);
n1=normalconv(x,y); %公式法
f1=fftconv(x,y);  %fft加速法
r1=conv(x,y); %matlab自带的正确的卷积
a1=overlap_add(x',y',100);  %overlap_add法，此时要求矩阵是1*L的
s1=overlap_save(x',y',100);  %overlap_save法，此时要求矩阵是1*L的

sum((r1-n1).^2)   %求误差从而验证正确性
sum((r1-f1).^2)
sum((r1-a1').^2)
sum((r1-s1').^2)