%%%%% ASSIGNMENT01 (2023) - Nicole Hucke %%%%%
%%%%% BASIC SIGNAL ANALYSIS %%%%%
 
% 1: Produce and plot a 1000 sample 2 Hz sine wave. Use peak-to-peak amplitude of 2 and DC offset of +2 and sampling of 100 Hz.

    freq = 2; 
    w = 2*pi*freq; % Angular frequency (radians/s)
    A = 1; % Since peak-to-peak is 2, we just divide by 2  
 
    % values of variable argument
    N = 1000; %number of samples
    fs = 100; %sampling fequency
    t = linspace(0,1000,10);  % Creates a vector of 1000 evenly spaced points in the interval [0,1000].
    
    % create sin wave
    wave = A * sin(w*t) + 2; %The +2 is because of the DC offset
 
    % plot
    plot(t, wave), title('Sine Wave'),xlabel('Sample Number'), ylabel('Amplitude')
   
% 2: Numerically calculate the standard deviation of this time series.  Do this without using the built-in MATLAB function std.  Provide the syntax (MATLAB equation) for your standard deviation calculation.  Verify that your result is the same as produced by std.
    %by hand:
    
    u = mean(wave); %Should be 2
    variance = sum((wave-u).^2)*1/(N-1);
    hand_std = sqrt(variance);
    disp(hand_std)
    
    %built in function:
    matlab_std = std(wave);
    disp(matlab_std)

% 3: repeat parts 1 and 2 for a square wave of same frequency amplitude, and offset.  Use function square.

    % PART 1:
    square_wave = A * square(w*t) + 2;
    figure
    plot(t, square_wave), title('Square Wave'),xlabel('Sample Number'), ylabel('Amplitude')
    
    %PART 2: 
    %by hand
    square_u = mean(square_wave); %Should be 2
    square_variance = sum((square_wave-square_u).^2)*1/(N-1);
    hand_square_std = sqrt(square_variance);
    disp(hand_square_std)
    
    %built in function:
    matlab_square_std = std(square_wave);
    disp(matlab_square_std)
    
% 4: plot uniform random noise (use rand) for the range [1,3] and then calculate its standard deviation. 

    x = rand(1000,1)*2+1;
    rand_std = std(x);
    disp(rand_std)
    figure
    plot(x), title('Random Wave')
 
% 5: use hist to plot histograms for the three data series.  For each histogram use 10 bins in the interval from 1 to 3.  I Suggest use of linspace command for bin construction.  You will want to be ‘clever’ about constructing the bin center values.
    
    bins = linspace(1,3,10);  % Creates a vector of 10 evenly spaced points in the interval [1,3].
    
    % Sine Wave: 
    figure
    histogram(wave,bins), title('Sine Wave Histogram'), xlabel('Samples'), ylabel('Number of Occurrences')
    
    % Square Wave: 
    figure
    histogram(square_wave,bins), title('Square Wave Histogram'), xlabel('Samples'), ylabel('Number of Occurrences')
    
    % Random Wave: 
    figure
    histogram(x,bins), title('Random Wave Histogram'), xlabel('Samples'), ylabel('Number of Occurrences')

% 6: replot the histograms from the previous figures as probability mass functions (i.e. sum of all bins total 100%).

    % Sine Wave: 
    [n, b] = hist(wave,bins); 
    figure
    bar(bins,n/N*100), title('Sine Wave PMF'), xlabel('Samples'), ylabel('Probability of Occurrence (%)')
    
    % Square Wave: 
    [n, b] = hist(square_wave,bins); 
    figure
    bar(bins,n/N*100), title('Square Wave PMF'), xlabel('Samples'), ylabel('Probability of Occurrence (%)')
    
    % Random Wave: 
    [n, b] = hist(x,bins); 
    figure
    bar(bins,n/N*100), title('Random Wave PMF'), xlabel('Samples'), ylabel('Probability of Occurrence (%)')
 
% 7: replot the histograms from the previous figure as probability density functions (integration must total 1).

 % Sine Wave: 
    [n, b] = hist(wave,bins); 
    figure
    bar(bins,n/N), title('Sine Wave PDF'), xlabel('Samples'), ylabel('Probability of Occurrence')
    
    % Square Wave: 
    [n, b] = hist(square_wave,bins); 
    figure
    bar(bins,n/N), title('Square Wave PDF'), xlabel('Samples'), ylabel('Probability of Occurrence')
    
    % Random Wave: 
    [n, b] = hist(x,bins); 
    figure
    bar(bins,n/N), title('Random Wave PDF'), xlabel('Samples'), ylabel('Probability of Occurrence')
