% decode function
function [string] = decode(bin)

    string = '';
    errors = 0;
    for i = 1:8:(length(bin))

        temp = bin(i:i+7);
        par = 0;

        for j = temp(2:end)
            if str2double(j) == 1
                par = par + 1;
            end
        end

        if mod(par, 2) == str2double(temp(1)) % parity check
            string = strcat(string, (bin2dec(temp(2:end)))); % if parity is correct, append the decoded character
        else
            string = strcat(string, '?'); % if the parity is incorrect, which means that the binary is flipped, append a ? for "unknown"
            errors = errors + 1;
        end
    end
    
    disp('error percentage(%) detected by parity is:');
    disp(errors/(length(bin)/8) *100); % no of bytes with wrong parity / total no of bytes
    
end