function dc=DCsign(x)

x=millisec(x);
N=length(x);

valid=zeros(N);
anchor=zeros(N);
pos =zeros(N);

for i=3: N-1
   
    if x(i)/x(i-1)<=1.05 && abs(x(i-1)-x(i-2))/x(i-2)<=0.15 && abs(x(i+1)-x(i))/x(i)<=0.15
        valid(i)=1;
        
    end
    if x(i)>x(i-1)
        anchor(i)=1;
    end
    if x(i)+x(i+1)-x(i-1)-x(i-2)>0
        pos(i)=1;
    end
    
end
    
d=zeros(N);
count=0;
for i=3:N-2
    
    d(i)=valid(i)*anchor(i)*(x(i)+x(i+1)-x(i-1)-x(i-2))/4;
    if valid(i)~=0 && anchor(i)~=0 && pos(i)~=0
        count=count+1;
        
    end

end
  
dc=sum(d)/count; 


end
