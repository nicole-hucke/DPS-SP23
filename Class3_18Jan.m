x = randi(6,10000,2); 
%first input is the quantization level, second is the amount of samples and third is the spacing
hist(x,1:6);

figure
x2 = sum(x,2);
hist(x2,1:12)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%now we will try to roll 5 dice

y = randi(6,10000,5);
figure
hist(y,1:6);

figure
x5 = sum(x,2);
hist(x5,1:12)

