function [fmeasure,prec_m,rec_m] = prec_rec()
%   Curves d'evaluació

fo=fopen('C:\Users\Omar\Desktop\UPC\3B\PIV\Lab\output.txt','r');
fi=fopen('C:\Users\Omar\Desktop\UPC\3B\PIV\Lab\input.txt','r');

precision = zeros(20,10);
recall = zeros(20,10);

for i=1:20
    aciertos = 0;
    fgets(fo); %Ignorem títol foto 
    input = fgets(fi);
    num = str2num(input(8:12));
    g = floor(num/4);
    for j=1:10
        lec_o = fgets(fo);
        num_o = str2num(lec_o(8:12));
        if floor(num_o/4) == g
            aciertos=aciertos+1;
        end
        precision(i,j) = aciertos/j;
        recall(i,j) = aciertos/4;
    end
    fgets(fo); %Ignorem enter
end

prec_m = zeros(1,10);
rec_m = zeros(1,10);
prec_m1 = zeros(1,10);
rec_m1 = zeros(1,10);

m=1:10;
for n=1:20
    prec_m(m) = prec_m(m)+precision(n,m);
    rec_m(m) = rec_m(m)+recall(n,m);
end
prec_m1=prec_m/max(prec_m);
rec_m1=rec_m/max(rec_m);
prec = sum(prec_m1/10);
rec = sum(rec_m1/10);

fmeasure = 2*(prec*rec)/(prec+rec);
F=num2str(fmeasure);
F_s=strcat('F=',F);
figure, plot(rec_m./20,prec_m./20), axis([0 1 0 1]), title('Precision-Recall Curve'), xlabel('Recall'), ylabel('Precision'), legend(F_s);
    
end