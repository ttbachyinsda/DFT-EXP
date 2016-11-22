function str=FFTrecognize(x,fs)
xx=fft(x);  %��DFT��ʹ��FFT�㷨
pyy=xx.*conj(xx); %��ģ
lx=length(x);
lx2=floor(lx/2);
f=(0:lx2-1);
for i=1:lx2       
    f(i)=f(i)*fs/lx;
end
%subplot(312);
%plot(f,pyy(1:lx2));       %����Ƶ��ͼ
pyk=pyy(1:lx2);
as=[697 770 852 941 1209 1336 1477 1633];
[pks,locs] = findpeaks(pyk,'minpeakdistance',100.*lx/fs);  %������ֵ֮����Ҫ��һ���Ŀ�ȣ������ҵ�������������������ֵ
max_value=max(pks);
bs(1)=find(pks==max_value);
pks(bs(1)) = pks(bs(1)).*-1;
max_value=max(pks);
bs(2)=find(pks==max_value);
if (locs(bs(1))>locs(bs(2)))
    p=bs(1);
    bs(1)=bs(2);
    bs(2)=p;
end
bs(1)=locs(bs(1));
bs(2)=locs(bs(2));

minn1=10000000;%�����ҵ����ֵ��Ƶ�����������Ƶ��
mint1=0;
for i=1:4
    if (abs(f(bs(1))-as(i))<minn1)
        minn1=abs(f(bs(1))-as(i));
        mint1=i;
    end
end
minn2=10000000;
mint2=0;
for i=5:8
    if (abs(f(bs(2))-as(i))<minn2)
        minn2=abs(f(bs(2))-as(i));
        mint2=i;
    end
end
pos1=mint1;
pos2=mint2;
str='error';
switch(pos1)%��������õ�������Ƶ�ʣ����ض�Ӧ�Ľ��
    case 1
        switch(pos2)
            case 5 
                str='1';
            case 6 
                str='2';
            case 7 
                str='3';
            case 8 
                str='A';
        end
    case 2
        switch(pos2)
            case 5 
                str='4';
            case 6 
                str='5';
            case 7 
                str='6';
            case 8 
                str='B';
        end
    case 3
        switch(pos2)
            case 5 
                str='7';
            case 6 
                str='8';
            case 7 
                str='9';
            case 8 
                str='C';
        end
    case 4
        switch(pos2)
            case 5 
                str='*';
            case 6 
                str='0';
            case 7 
                str='#';
            case 8 
                str='D';
        end
end