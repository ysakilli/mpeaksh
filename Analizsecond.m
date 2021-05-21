load veri;

Saat=datenum(Saat,'HH:MM:SS');
ts=Saat;
ts=ts-ts(1);
ts=ts*24;

veri=Veri;
a=input('alt limit degerini girin= ');
veri(veri<a)=0;
veri( all(veri), : ) = [];
veri(veri(:,1)== 0, :)= [];
% filtered=ismembertol(veri,1,0.001); %if needd

subplot(2,1,1)
% min
[val0,idx0] = min(Veri) ;
% max
[val1,idx1] = max(Veri) ; 
plot(ts,Veri);
hold on
plot(ts(idx0),Veri(idx0),'*r')
plot(ts(idx1),Veri(idx1),'*b')
puretime=length(veri);
veriplot=veri-a;
subplot(2,1,2)
plot(veriplot);
maks=max(veriplot);
minn=min(veriplot);

c=length(veri);
pureveri=(c/26)/60;
araliksaati=duration(hours(pureveri),'format','hh:mm')
energy=mean(veriplot);

title(['Alt limite gore ortalama = ' num2str(energy)]);
fprintf('\nMaks=%d\n',maks);
fprintf('Min=%d\n',minn);
fprintf('aralik saati sayi ile=%f saat\n',pureveri);
araliksaati

x=veriplot;
y=1:1:c;
y=transpose(y);
Int = cumtrapz(x);
Intv = @(a,b) max(Int(x<=b)) - min(Int(x>=a));
SegmentArea = Intv(0,c);
sonuc1=SegmentArea/(pureveri*60*26);
sonuc2=trapz(x)/(pureveri*60*26);

fprintf('Alan sonuc1: %f\n',sonuc1);
fprintf('integral ile sonuc2: %f\n',sonuc2);
fprintf('ortalama: %f\n',energy);


