function string = leadingzeronum(number)

if number < 10
    string = ['00',num2str(number)];
elseif number < 100
    string = ['0',num2str(number)];
else
    string = num2str(number);
end
