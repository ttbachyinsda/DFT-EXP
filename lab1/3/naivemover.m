function y=naivemover(x,fs,t,beginf,endf,afbeginf) %���ס��ƶ�������
xx=fft(x);
beginat=beginf*t;  %�ҵ���Ҫ�ƶ�����ʼƵ�ʺ���ֹƵ��
endat=endf*t;
afbeginat=floor(afbeginf*t);
ys=zeros(fs*t,1);
for i=beginat:endat  %�ƶ�Ƶ��
    ys(i-beginat+afbeginat)=xx(i);
end
y=ifft(ys);  %ifft�õ�ʱ���ź�