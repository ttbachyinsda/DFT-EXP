function recover(filename)  %解码
fs=44100;
t=3;
[wv,~]=audioread(filename);
fv1=1;
fv2=7000;
fv3=14000;
wv1=naivemover(wv,fs,t,fv1,fv1+5000,1);  %从对应频率段取出三个解码前的信号
wv2=naivemover(wv,fs,t,fv2,fv2+5000,1);
wv3=naivemover(wv,fs,t,fv3,fv3+5000,1);
audiowrite('output1.wav',wv1,fs);
audiowrite('output2.wav',wv2,fs);
audiowrite('output3.wav',wv3,fs);