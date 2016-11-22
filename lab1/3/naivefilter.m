function y=naivefilter(x,fs,t,beginf,endf) %简易滤波器
xx=fft(x);
beginat=beginf*t; %找到起始频率和终止频率对应的下标
endat=endf*t;
ys=zeros(fs*t,1); 
for i=beginat:endat %滤波
    ys(i)=xx(i);
end
y=ifft(ys); %ifft重新得到时域信号