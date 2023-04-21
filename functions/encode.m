function [bin] = encode(string)
    bin = '';
    for j = 1:length(string)
        temp = dec2bin(double(string(j)), 7);
        
        if length(temp) == 8
            temp = temp(2:8);
        end
        % display(["temp: ", temp]);
        
        ones = 0;
        for i = 1:7
            if temp(i) == '1'
                ones = ones + 1;
            end
        end

        temp = strcat(int2str(mod(ones, 2)), temp);

        
        bin = strcat(bin, temp);
    end
end




















