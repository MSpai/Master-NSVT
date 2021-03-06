function sdnn= computeSDNNOvWin(Signals,Files,fig)
sdnn=zeros(length(Files),16);

for k=1:length(Files)
    i=1;
    m=1;
    l=find(Signals(k,:));
    jump=length(l)/16 ;
    while (m<17)
        sdnn(k,m)=std(Signals(k,i:i+(jump-1)));
        m=m+1;
        i=i+(jump-((9*jump)/100));
    end
    
end
%disp(i);
%
hold on
for k=1:length(Files)
    hold on
plot(sdnn(k,:),'r');
title('SDNN with overlapping windows');
xlabel('windows');
ylabel('SDNN');
end
%
final=zeros(1,16);
for k=1:16
    final(1,k)=mean(sdnn(:,k));
end


%figure(fig);
plot(final,'b','LineWidth',2);
title('SDNN with overlapping windows');
xlabel('windows');
ylabel('SDNN');


figure(fig+1);
plot(final);
title('SDNN with overlapping windows');
xlabel('windows');
ylabel('SDNN');
