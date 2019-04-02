% this function gets from the user
% 1- arr:the data array
% 2- bit_duration: the duration of each bit wich we can get the number of bits per sample from
% 3- fs : the sampling frequency
% 4- ampl: the peak amplitude of the output signal
% 5- type: the type of encodeing used 


function output=encoder(arr,bit_duration,fs,ampl,type)
output=[];
ts=1/fs;
bits_no=ts/bit_duration;%to get the nember of bits needed to represent each sample
%if it was odd number then we should increase it by one so that manchester
%encodeing could work

if rem(bits_no,2)==1 
    bits_no=bits_no+1;
end

switch type
    case 'Unipolar NRZ'
      one=ampl*ones(1,bits_no);
      zero=ampl*zeros(1,bits_no);
        for i=1:length(arr)
           if arr(i)==1
               output=[output one];
           else
               output=[output zero];
           end
        end
        
    case 'Polar NRZ'
        
        one=ampl*ones(1,bits_no);
        zero=ampl*-1*ones(1,bits_no);
        
        for i=1:length(arr)
           if arr(i)==1
               output=[output one];
           else
               output=[output zero];
           end
        end
        
    case 'Manchester'
        
        one=ampl*[ones(1,bits_no/2), -1*ones(1,bits_no/2)];
        zero=ampl*[-1*ones(1,bits_no/2), ones(1,bits_no/2)];
        
        for i=1:length(arr)
           if arr(i)==1
               output=[output one];
           else
               output=[output zero];
           end
        end
        
    otherwise
        disp ('the ending tpe is undefined please check one of the list below:')
        disp('1-Unipolar NRZ')
        disp('2-Polar NRZ')
        disp('3-Manchester')
end


end