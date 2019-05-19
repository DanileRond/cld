tic
fo=fopen('output.txt','w');
fi=fopen('input.txt','r');
f_cld = fopen('clds.txt','r');

input = textread('clds.txt','%f');
index =vec2mat(input,length(input)/2000);

path='UKentuckyDatabase\UKentuckyDatabase\'; % ruta, si es la actual  poner path=pwd
ext='.jpg'; % extension, si no se desea filtrar por extension poner ext=''
ar=ls(path);


for j=1:20
    im =fgets(fi);
    image = imread(strcat('UKentuckyDatabase\UKentuckyDatabase\',im));
    refCld = cld(image);
    comparisons = zeros(2000, 2);
    compa = strings(size(ar,1),1);
for i=3:size(ar,1)
    name=ar(i,:);
    comparisons(i-2, 1) = distance(refCld, index(i-2,:), 6, 3, 3);
    comparisons(i-2, 2) = i-2;
    compa(i-2)=name;
end

[B,k] = sort(comparisons(:,1));
% B = [B k];

 fprintf(fo,'Retrieved list for query image %s',im);
  for i=1:10
    for j=1:2000
        if(j == k(i) )
            fprintf(fo,'%s\n',compa(j));
        else ;
        end
    end
  end
   fprintf(fo,'\n');
end
% B = sort(comparisons(:,2));
%srcFiles = dir('..\UKentuckyDatabase\*.jpg');

 toc

