x=rand(20,1);
y=rand(500,1);
n1=normalconv(x,y); %��ʽ��
f1=fftconv(x,y);  %fft���ٷ�
r1=conv(x,y); %matlab�Դ�����ȷ�ľ��
a1=overlap_add(x',y',100);  %overlap_add������ʱҪ�������1*L��
s1=overlap_save(x',y',100);  %overlap_save������ʱҪ�������1*L��

sum((r1-n1).^2)   %�����Ӷ���֤��ȷ��
sum((r1-f1).^2)
sum((r1-a1').^2)
sum((r1-s1').^2)