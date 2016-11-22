function y=naivemover(x,fs,t,beginf,endf,afbeginf) %简易“移动”操作
xx=fft(x);
beginat=beginf*t;  %找到需要移动的起始频率和终止频率
endat=endf*t;
afbeginat=floor(afbeginf*t);
ys=zeros(fs*t,1);
for i=beginat:endat  %移动频率
    ys(i-beginat+afbeginat)=xx(i);
end
y=ifft(ys);  %ifft得到时域信号