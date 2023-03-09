%% Inputs
%Test Parameters


sampleRate = 10000;                % [Samples/Second], Rate of data acquisition
totalTime = 2;                     % [s], Experiment runtime
                %Max output (+,-) of the analog output channel

%% Run DAQ
% Create DAQ Session
device = daq.getDevices;                                % Device is a variable that lists N.I. devices that are available
s = daq.createSession('ni');                            % Creates a session object using an N.I. product (that was found in the previous step)
s.Rate = sampleRate;                                    % Number of samples taken every second
s.DurationInSeconds = totalTime;                        % The duration of the test

% Sensor Channels
ch1=s.addAnalogInputChannel('Dev1', 'ai0', 'Voltage');  %Initialize channels to use
% ch2=s.addAnalogInputChannel('Dev1', 'ai1', 'Voltage'); 
% ch3=s.addAnalogInputChannel('Dev1', 'ai2', 'Voltage');  
% ch4=s.addAnalogInputChannel('Dev1', 'ai3', 'Voltage');  
% ch5=s.addAnalogInputChannel('Dev1', 'ai4', 'Voltage');  
% ch6=s.addAnalogInputChannel('Dev1', 'ai5', 'Voltage');  
% ch7=s.addAnalogInputChannel('Dev1', 'ai6', 'Voltage');  
% 
% Define Sensor Input Type
% s.Channels(1).InputType = 'SingleEnded';                  %Define channel type
% s.Channels(2).InputType = 'SingleEnded';
s.Channels(1).InputType = 'Differential';           
% s.Channels(2).InputType = 'Differential';           
% s.Channels(3).InputType = 'Differential';        
% s.Channels(3).Range = [-0.20 0.20];                        % Set channel gain by defining range (-+10V is default)                   
% s.Channels(4).InputType = 'Differential';         
% s.Channels(4).Range = [-0.20 0.20];                  
% s.Channels(5).InputType = 'Differential';         
% s.Channels(6).InputType = 'Differential';         
% s.Channels(7).InputType = 'Differential';         

% Output Channels 
% ch8=s.addAnalogOutputChannel('Dev1', 'ao0', 'Voltage'); 
% ch9=s.addAnalogOutputChannel('Dev1', 'ao1', 'Voltage'); 
% s.queueOutputData(outmat);

% Start Test and Collect Data
[data,time]=s.startForeground;                         % Starts operations of session object "s"
s.wait();                                               % Blocks matlab until all background objects complete (session object "s")
s.release();                                            % Releases the hardware (not necessary in this use)
delete(s);                                              % Deletes the session object hardware


      
%% Diplay Data


figure
plot(time,data);

% Pulse Counter (Convert Flowmeter output)
% A = zeros(length(data),2);
% 
% a = 0;
% b = 0;
% for i = 2:(length(data(:,5)))
%     if data(i,5) - data(i-1,5) > 1
%         if a > 0
%             b = i;
%             A(a:b,1) = (1/(15900))/((time(b) - time(a))/60);
%             a = b;
%         else
%             a = i;
%         end        
%     end
% end







