function plotFFT(field)
Icou2 = length(field);
Icou = Icou2/2;
%if (textFFT == 'y')
  fieldr = Icou2^2*fftshift(ifftn(ifftshift(field)));
surf(real(fieldr),'EdgeColor','None');
view(2);  
% end
% if (textFFT == 'n')
% surf(real(field),'EdgeColor','None');
% view(2);  
end

