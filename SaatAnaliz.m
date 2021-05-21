%veri=xlsread('veri');
%load veri;
while 1
saat1=input('bakilacak saat ilk degerini giriniz= ');

m=(saat1*60)+1;
n=(m+59);
k=(saat1);
l=(k+0.6);

a=veri(m:n,1);
b=veri(m:n,2);
x=veri(:,1);
y=veri(:,2);

subplot(2,1,1);
plot(x,y)
xlim([k l]);
%ylim([0 5000]);
xlabel('Saat');
ylabel('Enerji');

subplot(2,1,2);
plot(a,b);
h=area(a,b);
xlabel('Saat');
ylabel('Enerji');
energy = trapz(a,b);
title(['Belirlenen saatteki Enerji = ',num2str(energy),'kW/h'])
fprintf('\n belirlenen alanin integrali= %f',energy);
son=input('\n bitirmek için ''h'' tusuna basiniz= ','s');
if son=='h'
 break
end
end

  



        
        
