function [Males]= storeMales(Files)

Males=zeros(length(Files),1024);
for k=1:length(Files)
    FileNames=Files(k).name;
    disp(FileNames);
    
    fid=fopen(FileNames);
    line=fgets(fid);
    %disp(line);
    i=1;
    Males(k,i)=str2num(line);
    i=i+1;
    while ischar(line)&& (i<=1024)
        %disp(line);
        line = fgets(fid);
        Males(k,i)=str2num(line);
        i=i+1;   
    end
    %disp(line);
    fclose(fid);
         
end