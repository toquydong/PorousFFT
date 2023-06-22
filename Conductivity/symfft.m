function [z]=symfft(x)
% Icou2 = length(x);
% Icou = Icou2/2;
% z = x;
% %xshift = circshift(x,Icou+1,2);
% for i=1:Icou2
%     for j=1:Icou2
%         k1 = i-(Icou+1);
%         k2 = j-(Icou+1);
%         if Icou+1-k1 <= Icou2 & Icou+1-k2 <= Icou2
%             z(i,j)=1/2*(x(i,j)+conj(x(Icou+1-k1,Icou+1-k2)));
%         end
%                   
%     end
% end
z = x;
z(1,:)=0;
z(:,1)=0;
%z= DFT2(real(IDFT2(x)));
%z=1/2*(conj(rot90(x,2))+x);

%z=1/2*(conj(rot90(x,2))+x);





