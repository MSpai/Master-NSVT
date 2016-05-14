function numberPNN50 = computePNN50(Files,NN50)
    numberPNN50=zeros(size(Files,1),1);
    for i=1:size(Files,1)
        numberPNN50(i)=NN50(i)/(length(Files));
    end
