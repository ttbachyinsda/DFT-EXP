function y=goertzelrecognize(x)
N=205;
k=[18 20 22 24 31 34 38 42]; %DFT�������
for m=1:8
    X(m)=mygo(x(1:205)',k(m));  %��goertzel�㷨����8��DFT����
end
val=abs(X);%�г�8��DFT����
maxn2=0;
maxt2=0;
for s=5:8    %�����кź��к�
    if (abs(val(s))>=maxn2)
        maxn2=abs(val(s));
        maxt2=s;
    end
end
maxn1=0;
maxt1=0;
for r=1:4
    if (abs(val(r))>=maxn1)
        maxn1=abs(val(r));
        maxt1=r;
    end
end
y=(maxt1-1).*4+maxt2-4;