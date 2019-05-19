function dist = distance(cld1, cld2, NCoefsY, NCoefsCb, NCoefsCr)
% f = fopen('RCM.txt','r');
% input = textread('RCM.txt','%f');
% index =vec2mat(input,length(input)/24);
% pos = 1;
% figure(1)
% histY = histogram(input(1:64));
% figure(2)
% histCb = histogram(input(65:128));
% figure(3)
% histCr = histogram(input(129:192));
% 

distY = (cld1(1:NCoefsY) - cld2(1:NCoefsY))*(cld1(1:NCoefsY) - cld2(1:NCoefsY))';
distCb = (cld1((NCoefsY+1):(NCoefsY +NCoefsCb)) - cld2((NCoefsY+1):(NCoefsY +NCoefsCb)))*(cld1((NCoefsY+1):(NCoefsY +NCoefsCb)) - cld2((NCoefsY+1):(NCoefsY +NCoefsCb)))';
distCr = (cld1((NCoefsY+NCoefsCb+1):(NCoefsY + NCoefsCb+NCoefsCr)) - cld2((NCoefsY+NCoefsCb+1):(NCoefsY +NCoefsCb+NCoefsCr)))*(cld1((NCoefsY+NCoefsCb+1):(NCoefsY +NCoefsCb+NCoefsCr)) - cld2((NCoefsY+NCoefsCb+1):(NCoefsY +NCoefsCb+NCoefsCr)))';

dist = sqrt(distY) + sqrt(distCb) + sqrt(distCr);

end

