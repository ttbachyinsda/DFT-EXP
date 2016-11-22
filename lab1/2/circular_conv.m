function y = circular_conv(x1,x2,L)
x1k=fft(x1,L);
x2k=fft(x2,L);
yk = x1k .* x2k;
y = ifft(yk);

