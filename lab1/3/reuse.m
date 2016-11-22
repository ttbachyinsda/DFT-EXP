function reuse(filename1,filename2,filename3)  %编码
t=3;
fs=44100;
[wv1,~]=audioread(filename1);
[wv2,~]=audioread(filename2);
[wv3,~]=audioread(filename3);
size(wv1)
size(wv2)
size(wv3)
wv1=naivefilter(wv1,fs,t,1,5000);  %先滤一次波
wv2=naivefilter(wv2,fs,t,1,5000);
wv3=naivefilter(wv3,fs,t,1,5000);
audiowrite('o1.wav',wv1,fs);
audiowrite('o2.wav',wv2,fs);
audiowrite('o3.wav',wv3,fs);
fv1=1;
fv2=7000;
fv3=14000;
x1=naivemover(wv1,fs,t,1,5000,fv1);  %再将滤后的部分编码
x2=naivemover(wv2,fs,t,1,5000,fv2);
x3=naivemover(wv3,fs,t,1,5000,fv3);
s=x1+x2+x3;
audiowrite('output.wav',s,fs);