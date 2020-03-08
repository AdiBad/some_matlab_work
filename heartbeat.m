%Extracting the ECG signal
load('data_ex2_1.mat', 'ECG')
normal_ecg = zscore(ECG.data)
fig_handle = figure; 
fs = 250
tt=linspace(1/fs, length(normal_ecg)/fs, length(normal_ecg));
plot ( tt,normal_ecg);
axis('tight');
xlabel('Time in seconds');
ylabel('Normalized Amplitude');
title('ECG');
figure(fig_handle);
keyboard 
fprintf('\n Select anchor points of an ECG heartbeat (using mouse left click)');
    [xd,yd] = ginput; % choose an undetermined number of points
    xd = round(xd*ECG.fs); % round towards integer sample indices
    
    %Before P
    x_bp = linspace(xd(1), xd(2), 50);
    y_bp = interp1(xd(1:2), yd(1:2),  x_bp);
    
    
    %For P
    x_p = linspace(xd(2), xd(5), 50);
    y_p = interp1(xd(2:5), yd(2:5),  x_p, 'spline');
    
    %For PQ
    x_pr = linspace(xd(5), xd(6), 50);
    y_pr = interp1(xd(5:6), yd(5:6),  x_pr);
    
    %For Q
    x_q = linspace(xd(6), xd(9), 50);
    y_q = interp1(xd(6:9), yd(6:9),  x_q, 'pchip');
    
    %For R
    x_r = linspace(xd(9), xd(11), 50);
    y_r = interp1(xd(9:11), yd(9:11),  x_r, 'pchip');
    
    %For S
    x_s = linspace(xd(11), xd(13), 50);
    y_s = interp1(xd(11:13), yd(11:13),  x_s, 'pchip');
    
    %For ST
    x_st = linspace(xd(13), xd(15), 50);
    y_st = interp1(xd(13:15), yd(13:15),  x_st);
    
    %For T
    x_t = linspace(xd(15), xd(19), 50);
    y_t = interp1(xd(15:19), yd(15:19),  x_t, 'spline');
    
    %save horiz
    concated = cat(2,y_bp, y_p, y_pr, y_q, y_r, y_s,y_st, y_t);
    
%save('myheartbeat.mat','xd', 'yd', 'concated');

figure()
plot(concated)
axis('tight');
xlabel('Time in seconds');
ylabel('Normalized Amplitude');
title('My heartbeat in this ECG');
