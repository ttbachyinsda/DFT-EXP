function y=naivefilter(x,fs,t,beginf,endf) %�����˲���
xx=fft(x);
beginat=beginf*t; %�ҵ���ʼƵ�ʺ���ֹƵ�ʶ�Ӧ���±�
endat=endf*t;
ys=zeros(fs*t,1); 
for i=beginat:endat %�˲�
    ys(i)=xx(i);
end
y=ifft(ys); %ifft���µõ�ʱ���ź�