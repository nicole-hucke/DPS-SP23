help rand()

x = rand(512,1)*10;
whos x

plot(x, '-o')
histogram(x)

%------------------------------------------------------------
help randn

y = randn(512,1);
%this will give me a mean=0 and a std deviation=1
plot(y)
figure
histogram(y)

%if we wanted a mean=3 and std dev=0.2
z = randn(2^24,1)*.2 + 3; %the bigge the sample size, the better the "fit"
figure
plot(z)
ylim([-4,8])
figure
histogram(z)

whos x %we can see the class of data we have. In this case it's a double (32 bits of resolution)
% 2^32 amount of possible values that could have been generated

%-------------------------------------------------------------------
%we want to see the difference between absolute, peak-to-peak, rms and DC 

absamp = max(z); %will be the absolute amplitude
range = max(z)-min(z); %peak-to-peak amplitude is basically the range
rms = sqrt(mean(z.^2)); %root mean square amplitude
DC = mean(z); %comes from electrical engineering