function recover(filename)  %����
fs=44100;
t=3;
[wv,~]=audioread(filename);
fv1=1;
fv2=7000;
fv3=14000;
wv1=naivemover(wv,fs,t,fv1,fv1+5000,1);  %�Ӷ�ӦƵ�ʶ�ȡ����������ǰ���ź�
wv2=naivemover(wv,fs,t,fv2,fv2+5000,1);
wv3=naivemover(wv,fs,t,fv3,fv3+5000,1);
audiowrite('output1.wav',wv1,fs);
audiowrite('output2.wav',wv2,fs);
audiowrite('output3.wav',wv3,fs);