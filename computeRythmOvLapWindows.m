function  rate1 = computeRythmOvLapWindows(Signals,Files,fig)

rate1=zeros(length(Files),16);

for k=1:length(Files)
    i=1;
    m=1;
    l=find(Signals(k,:));
    jump=length(l)/16 ;
    while (m<17)
       
        mean1=mean(Signals(k,i:i+(jump-1)));
        rate1(k,m)=1/mean1;
        m=m+1;
        i=i+(jump-((9*jump)/100));
    end
    
end
%disp(i);
%

figure(fig+100);
hold on
for k=1:length(Files)
    hold on
plot(rate1(k,:),'r');
title('Rate with overlapping windows');
xlabel('windows');
ylabel('rate');
end
%
final=zeros(1,16);
for k=1:16
    final(1,k)=mean(rate1(:,k));
end



plot(final,'b','LineWidth',2);
title('Rate with overlapping windows');
xlabel('windows');
ylabel('rate');


figure(fig+104);
plot(final);
title('Rate with overlapping windows');
xlabel('windows');
ylabel('rate');