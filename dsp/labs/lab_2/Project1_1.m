%% Basic Parameters
fs=8000;    %Sampling Frequency
ts=1/fs;    %Sampling period
n=(0:800);     %Maximum value of n
%% Frequencies
%The higher frequency part
fcolumn1=1209; fcolumn2=1336; fcolumn3=1477; fcolumn4=1633;
%The lower frequency part
frow1=697; frow2=770; frow3=852; frow4=941;
%% set the numbers with specific frequencies
num1=sin(2*pi*fcolumn1*ts*n)+sin(2*pi*frow1*ts*n);
num2=sin(2*pi*fcolumn2*ts*n)+sin(2*pi*frow1*ts*n);
num3=sin(2*pi*fcolumn3*ts*n)+sin(2*pi*frow1*ts*n);
numA=sin(2*pi*fcolumn4*ts*n)+sin(2*pi*frow1*ts*n);
num4=sin(2*pi*fcolumn1*ts*n)+sin(2*pi*frow2*ts*n);
num5=sin(2*pi*fcolumn2*ts*n)+sin(2*pi*frow2*ts*n);
num6=sin(2*pi*fcolumn3*ts*n)+sin(2*pi*frow2*ts*n);
numB=sin(2*pi*fcolumn4*ts*n)+sin(2*pi*frow2*ts*n);
num7=sin(2*pi*fcolumn1*ts*n)+sin(2*pi*frow3*ts*n);
num8=sin(2*pi*fcolumn2*ts*n)+sin(2*pi*frow3*ts*n);
num9=sin(2*pi*fcolumn3*ts*n)+sin(2*pi*frow3*ts*n);
numC=sin(2*pi*fcolumn4*ts*n)+sin(2*pi*frow3*ts*n);
numstar=sin(2*pi*fcolumn1*ts*n)+sin(2*pi*frow4*ts*n);
num0=sin(2*pi*fcolumn2*ts*n)+sin(2*pi*frow4*ts*n);
numwell=sin(2*pi*fcolumn3*ts*n)+sin(2*pi*frow4*ts*n);
numD=sin(2*pi*fcolumn4*ts*n)+sin(2*pi*frow4*ts*n);
%% design a bandpass filter of the higher frequencies in columns using fir2
N1=400;
% bandwidth should be less than the difference of adjacent frequencies
bandwidth_high=100;
% the vector used to store coefficients of filter with different pass
% frequencies. since there are four frequencies and the order of the filter
% is N, then 4 × N+1 is needed for the coef_columns
coef_high=zeros(4,N1+1);
f_high=[fcolumn1 fcolumn2 fcolumn3 fcolumn4];
for i=1:4
    % fhigh_0 is the central frequency
    fhigh_0=f_high(i);
    % fhigh_c1 is the lower cutoff frequency
    fhigh_c1=fhigh_0-bandwidth_high/2;
    % fhigh_c2 is the higher cutoff frequency
    fhigh_c2=fhigh_0+bandwidth_high/2;
    % fir2 generates a figital filter which is represented by the
    % coefficients, therefore coef_high is a set of coefficients.
    % since the 1 in [0,fhigh_c1*2*ts,fhigh_c2*2*ts,1] correspondes to
    % Nyquist Frequency. Then we need to normalize fhigh_c1 and fhigh_c2 by
    % multiplying the reciprocal of Nyquist Frequency (Ω_T/2).
    coef_high(i,:)=fir2(N1,[0,fhigh_c1*2*ts,fhigh_c2*2*ts,1],[0,1,1,0]);
end

% b = fir2(n,f,m)
    %f is a vector of frequency points in the range from 0 to 1, where 1 
    % corresponds to the Nyquist frequency. Ω_T/2 is the Nyquist frequency.
    % The first point of f must be 0 and the last point must be 1. f must 
    % be sorted in increasing order. 
    % Duplicate frequency points are allowed and are treated as steps in 
    % the frequency response.
    % m is a vector containing the desired magnitude response at each of 
    % the points specified in f.
    % n For configurations with a passband at the Nyquist frequency, fir2 
    % always uses an even order. 
    % If you specify an odd-valued n for one of those configurations, 
    % then fir2 increments n by 1.
%% design a bandpass filter of the lower frequencies in rows using fir2
N2=400;
% bandwidth should be less than the difference of adjacent frequencies
bandwidth_low=70;
% the vector used to store coefficients of filter with different pass
% frequencies. since there are four frequencies and the order of the filter
% is N, then 4 × N+1 is needed for the coef_low
coef_low=zeros(4,N2+1);
f_low=[frow1 frow2 frow3 frow4];
for i=1:4
    % flow_0 is the central frequency
    flow_0=f_low(i);
    % flow_c1 is the lower cutoff frequency
    flow_c1=flow_0-bandwidth_low/2;
    % flow_c2 is the higher cutoff frequency
    flow_c2=flow_0+bandwidth_low/2;
    % fir2 generates a figital filter which is represented by the
    % coefficients, therefore coef_low is a set of coefficients
    coef_low(i,:)=fir2(N2,[0,flow_c1*2*ts,flow_c2*2*ts,1],[0,1,1,0]);
end

%% set the dial number 
% get the numer from the keyboard.
prompt="which number you want to dial?    ";
x=input(prompt,"s");
if x=="1"
    dialnum=num1;
elseif x=="2"
    dialnum=num2;
elseif x=="3"
    dialnum=num3;
elseif x=="4"
    dialnum=num4;
elseif x=="5"
    dialnum=num5;
elseif x=="6"
    dialnum=num6;
elseif x=="7"
    dialnum=num7;
elseif x=="8"
    dialnum=num8;
elseif x=="9"
    dialnum=num9;
elseif x=="#"
    dialnum=numwell;
elseif x=="0"
    dialnum=num0;
elseif x=="*"
    dialnum=numstar;
elseif x=="a"
    dialnum=numA;
elseif x=="b"
    dialnum=numB;
elseif x=="c"
    dialnum=numC;
elseif x=="d"
    dialnum=numD;
end
sound(dialnum);
%% calculate the distance between the breakpoints of higher frequencies
distance_high=zeros(1,4);
for i=1:4
% y = filter(b,a,x) filters the input data x using a rational transfer 
% function defined by the numerator and denominator coefficients b and a.
    output_high=filter(coef_high(i,:),1,dialnum);
% the fft is the fourier transform of output_high.
    distance_high(1,i)=max(abs(fft(output_high)));
end
% we want the maximum value. since only when at a particular frequency the
% value appears, otherwise the values are approximately zero at remaining
% frequencies. Therefore, when we have the maximum value and the index, the
% specific frequancy can be derived from the index of the maximum value.
[max_high, index_high]=max(distance_high(1,:));
%% calculate the distance between the breakpoints of lower frequencies
distance_low=zeros(1,4);
for i=1:4
% y = filter(b,a,x) filters the input data x using a rational transfer 
% function defined by the numerator and denominator coefficients b and a.
    output_low=filter(coef_low(i,:),1,dialnum);
% the fft is the fourier transform of output_low.
    distance_low(1,i)=max(abs(fft(output_low)));
end
[max_low, index_low]=max(distance_low(1,:));
%% identify dial number
if index_low == 1 && index_high == 1
    dialnumber = "1";
elseif index_low == 1 && index_high ==2
    dialnumber = "2";
elseif index_low == 1 && index_high ==3
    dialnumber = "3";
elseif index_low == 1 && index_high ==4
    dialnumber = "A";
elseif index_low == 2 && index_high ==1
    dialnumber = "4";
elseif index_low == 2 && index_high ==2
    dialnumber = "5";
elseif index_low == 2 && index_high ==3
    dialnumber = "6";
elseif index_low == 2 && index_high ==4
    dialnumber = "B";
elseif index_low == 3 && index_high ==1
    dialnumber = "7";
elseif index_low == 3 && index_high ==2
    dialnumber = "8";
elseif index_low == 3 && index_high ==3
    dialnumber = "9";
elseif index_low == 3 && index_high ==4
    dialnumber = "C";
elseif index_low == 4 && index_high ==1
    dialnumber = "*";
elseif index_low == 4 && index_high ==2
    dialnumber = "0";
elseif index_low == 4 && index_high ==3
    dialnumber = "#";
elseif index_low == 4 && index_high ==4
    dialnumber = "D";
end
dialnumber