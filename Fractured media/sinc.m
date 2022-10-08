function y = sinc(x)
% SINC(x) = SIN(x) / x

% Sinc for small |x|.
y=ones(size(x));
i=find(x);
y(i)=sin(x(i))./(x(i));
end