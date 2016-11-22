filename='./audio/格式工厂9_3.wav';
[wv,fs]=audioread(filename);
fs
% audiowrite(filename,wv,8000);
x=wv;
FFTrecognize(x,fs)
ans=rand(floor(length(x)/205),1);
for i=1:floor(length(x)/205)%在保证采样率为8000的情况下，可以分成205的小段，取出现次数最多的那个
    ans(i)=goertzelrecognize(x((i-1)*205+1:i*205));
end
X = unique(ans);
[M N]=hist(ans,X); maxcount = max(M);
tmp=find(M==maxcount);
maxt=N(tmp);
cm=[49,50,51,65,52,53,54,66,55,56,57,67,42,48,35,68]; %输出结果的ascii码
setstr(cm(maxt))
