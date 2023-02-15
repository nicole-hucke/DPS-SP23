%Class Jan27
x = [0 0 1 2 3 4 2 0 -2 0 0];
y = movmean(x,3);

% convolution vector
h = [1/3, 1/3, 1/3];
z = conv(x,h);

%IT'S THE SAME IF I CHANGE THE OrDEr!! 
z1 = conv(h,x);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% from question 2 on the quiz: a center derivative
h2 = [1/2, 0, -1/2];
y2 = conv(x,h);

%%%%%%%%%%%% from question 5 %%%%%%% 
h5 = [1, -2, 1];
y5 = conv(x,h); %THIS IS A SECOND DErIVATIVE
