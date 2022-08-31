function z=convfft2(x,y,text)
m= min(length(x),length(y));
n = length(x) + length(y) - 1; % we need to zero-pad
zfull = ifft2(fft2(x,n,n).*fft2(y,n,n)); 
if (text == 'full')
    z=zfull; 
end

if (text == 'same')
    m1 = round((1+n)/2 - (m-1)/2); %(ly+1)/2
    m2 = round((1+n)/2 + (m-1)/2); %(ly-1)/2+lx
    z=zfull(m1:m2,m1:m2);
end





