%%%%% ASSIGNMENT 04 (2023) Nicole Hucke
%%%%% Goals: Remove spurious data and then convolve atmospheric CO2 data with two types of filters.  Use the data file called CO2_MaunaLoa.mat in the analysis below. 

%% 1: 
%Read in CO2_MaunaLoa.mat.  The time series is sampled monthly and vectorized as decimal years. Start by plotting the time series with the proper time basis. Then get rid of the spurious data points using medfilt1 with an order of 3 and plot the resultant filtered data on the same graph as the original data.

load CO2_MaunaLoa.mat

% convert decimal years to readable years
years = datevec(datenum(num2str(ts), 'yyyy'));
years = years(:,1); %just putting all years in a single variable rather than a matrix
% plot the original data 
figure;
plot(years, CO2);
xlabel('Year');
ylabel('CO2 concentration');
title('CO2 data from Mauna Loa');

% filter the data using a median filter
CO2_filt = medfilt1(CO2, 3);
% plot the filtered data
hold on
plot(years(:,1), CO2_filt);
legend('Original data', 'Filtered data');

%% 2: 
%Apply the convolution (impulse response) filter of Fig. 6-3a (from your textbook).  Construct this filter time series using a 31-sample vector comprised of a half period (positive sinusoid) with integrated amplitude of exactly 1.  Use conv to produce and to plot the input and output signal on the same graph.  For input signal use the CO2 data after the median filter has been applied.  The tricky part is to plot the output with an appropriate timeline, which requires removing both the early and late artifacts in the output.

% filter impulse response
h = sin(pi*(0:30)/30); %31 samples of positive half-sine wave with amplitude 1
h = h / sum(h); %  normalizing filter to make the integrated amplitude = 1
figure;
plot(h);
title('Impulse response for convolution');

% apply the filter using convolution
CO2_conv2 = conv(CO2_filt, h);
CO2_conv2 = CO2_conv2(16:end-15); % shortening back to CO2 length of 520 because after convolution it was 550! I take out the first 15 and the last 15. 

% plot the input and output signal on the same graph
figure;
plot(years, CO2_filt, 'b');
hold on;
plot(years, CO2_conv2, 'r');
xlabel('Year');
ylabel('CO2 concentration (ppm)');
title('Filtered CO2 data and convolved output');
legend('Filtered data', 'Convolved data');

%% 3: 
%Apply the convolution (impulse response) filter of Fig. 6-3b (from your textbook).  Construct this filter by modifying the filter used in part 2.  Notice that this filter is the negative sign of the filter in Fig. 6-3a (except for the mid-point).  You will need to scale the mid-point value such that the integrated amplitude of the filter is precisely zero.  Use conv to produce and to plot the input and output signal on the same graph.  As in part 2, use the median-filtered CO2 data for the input.  Also make sure to plot output with an appropriate timeline and to remove both the early and late artifacts in the output.

% making the new filter based off the first one
h2 = h*-1;
h2(16) = h2(16) + 1; %adding the "delta" impulse 
figure;
plot(h2)
title('Highpass impulse response for convolution');

% apply the filter using convolution
CO2_conv2 = conv(CO2_filt, h2);
% shortening back to CO2 length of 520 because after convolution it was 550
CO2_conv2 = CO2_conv2(16:end-15); %I take out the first 15 and the last 15 
% also want to compare using the 'same' argument in this function
CO2_conv2_same = conv(CO2_filt, h2, 'same');

% plot the input and output signal on the same graph
figure;
plot(years, CO2_filt, 'b');
hold on;
plot(years, CO2_conv2, 'r');
hold on;
plot(years, CO2_conv2_same, 'g')
xlabel('Year');
ylabel('CO2 concentration (ppm)');
title('Filtered CO2 data and convolved output');
legend('Filtered data', 'Convolved data', 'Convolved using "same"');

%% Short answers:
fprintf("Briefly describe what the median filter is doing in part 1: Comment on whether it a linear filter? \n")
fprintf("The median filter is applied to remove spurious data. It's a *nonlinear* (the output is not a linear combination of the input sample) filtering technique that replaces each data point with the median of neighboring points. \n\n") 

fprintf("Could the input signal be recovered if you knew the type of median filter? \n")
fprintf("If we knew the type of median filter, we could not recover the original input signal because median filters remove information by their very nature, and are not able to trace back to the original signal \n\n")

fprintf("Beyond removing the spurious data how does it affect the data at the peaks and troughs of each cycle? \n")
fprintf("By reducing the amplitude of the spikes as the filter replaces each spike with the median value of its neighboring samples. This results in a smoother signal without the spurious data points, but the peaks and troughs are less pronounced. \n\n")

fprintf("Describe what the filter would look like if you combined the impulse response of 6-3a and 6-3b. Describe what the output signal would look like if you added the output signal from parts 2 and 3) \n")
fprintf(" The output signal from part 2 is a low-pass filtered version of the input signal, while the output signal from part 3 is a high-pass filtered version of the input signal. Combining these two output signals would result in a signal that has had both low-frequency and high-frequency components removed, leaving only the mid-band frequencies. In other words, the resulting signal would be a bandpass filtered (only a certain range of frequencies) version of the original CO2 data. \n\n")

fprintf("Which filter (below) removes the DC offset? \n")
fprintf("The high-pass filter will remove the DC offset (second graph in the image)")
