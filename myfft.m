function [output] = myfft(input)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here


N=length(input);
A=bit_reverse(input);
NL=log2(N);
for i=1:NL
    m=2^i;
    wm=cos(2*pi/m)-1j*sin(2*pi/m);
    for j=0:m:N-1;
      w=1;
      for k=1:m/2
          t=w*A(k+j+m/2);
          u=A(k+j);
          A(k+j)=u+t;
          A(k+j+m/2)=u-t;
          w=w*wm;
      end
    end
end
   output=A;

end

