filename='./audio/��ʽ����9_3.wav';
[wv,fs]=audioread(filename);
fs
% audiowrite(filename,wv,8000);
x=wv;
FFTrecognize(x,fs)
ans=rand(floor(length(x)/205),1);
for i=1:floor(length(x)/205)%�ڱ�֤������Ϊ8000������£����Էֳ�205��С�Σ�ȡ���ִ��������Ǹ�
    ans(i)=goertzelrecognize(x((i-1)*205+1:i*205));
end
X = unique(ans);
[M N]=hist(ans,X); maxcount = max(M);
tmp=find(M==maxcount);
maxt=N(tmp);
cm=[49,50,51,65,52,53,54,66,55,56,57,67,42,48,35,68]; %��������ascii��
setstr(cm(maxt))
