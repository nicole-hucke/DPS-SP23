%%%%% ASSIGNMENT 04 (2023) Nicole Hucke

%%%%% Goals: Remove spurious data and then convolve atmospheric CO2 data with two types of filters.  Use the data file called CO2_MaunaLoa.mat in the analysis below. 

%% 1: 
%Read in CO2_MaunaLoa.mat.  The time series is sampled monthly and vectorized as decimal years. Start by plotting the time series with the proper time basis. Then get rid of the spurious data points using medfilt1 with an order of 3 and plot the resultant filtered data on the same graph as the original data.

load CO2_MaunaLoa.mat

% convert decimal years to readable years
years = datevec(datenum(num2str(ts), 'yyyy'));
years = years(:,1); %just putting all years in a single variable rather than a matrix
% plot the original data 
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
figure;
plot(h);
title('Impulse response for convolution');

% Normalize the filter
%h = h / sum(h);

% Apply the filter using convolution
y = conv(CO2_filt, h);

% Remove the early and late artifacts in the output
y = y(16:end-15);
%t = linspace(years(:,1), years(end), length(y));

% Plot the input and output signal on the same graph
figure;
plot(years(:,1), CO2_filt, 'b');
hold on;
plot(years(:,1), y, 'r');
xlabel('Year');
ylabel('CO2 concentration (ppm)');
title('Filtered CO2 data and convolved output');
%legend('Filtered data', 'Convolved output');