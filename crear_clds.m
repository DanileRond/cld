path='UKentuckyDatabase\UKentuckyDatabase\'; % ruta, si es la actual  poner path=pwd
ext='.jpg'; % extension, si no se desea filtrar por extension poner ext=''
ar=ls(path);

f=fopen('clds.txt','w'); 

index = zeros(12, size(ar,1) - 2);
 for j=3:size(ar,1)
   cn=ar(j,:);
   [~,~,ex]=fileparts(cn);
    %isdir(cn)
   if (and(~isdir(fullfile(path,cn)),or(strcmpi(strtrim(ex),ext),isempty(ext))))
       disp(cn)
       if(length(cn)>3)
        image = imread(strcat(path,cn));
        i = cld(image)
        index(:,j-2) = i;
        fprintf(f,'%d ',i);
        fprintf(f,'\n');
       end
   end
 end
