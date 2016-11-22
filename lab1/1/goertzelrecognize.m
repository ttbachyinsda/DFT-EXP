function y=goertzelrecognize(x)
N=205;
k=[18 20 22 24 31 34 38 42]; %DFT样本序号
for m=1:8
    X(m)=mygo(x(1:205)',k(m));  %用goertzel算法计算8点DFT样本
end
val=abs(X);%列出8点DFT向量
maxn2=0;
maxt2=0;
for s=5:8    %查找行号和列号
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