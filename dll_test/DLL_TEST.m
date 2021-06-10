clear
asm = NET.addAssembly('C:\Users\raulr\Desktop\HexLibrary.dll');
% Control absolute time by changing absTime variable
hexControl = HexLibrary.Form1;

% Length of Time
Duration = 60; % in sec

% Rotation Reference in cm (?); Z is up and down
RefX = 0;
RefY = 0;
RefZ = 40;

% Movement axis
X = 0;
Y = 0;
Z = 89;

% Axis of Rotation
phi = 0; % Roll?
theta = 0; % Yaw
psi = 0; % Pitch?

% Reference Function Call
[ArmExtensionMMs,validL,~,~,~,~,~] = CalculateArmLength(X, Y, Z,...
                                                        phi, theta, psi,...
                                                        RefX, RefY, RefZ)
% isLengthValid,restingArmLengths, currentArmLengths, Rwp, biw, ai
% Horizontal Movement (Z)
Begin = 89;
Ending = 110;

InitialMovement = Begin:0.1:Ending;

% Axis of Rotation (Z)
EyeReference = 60;

% Degrees of Rotation (psi)
RotDeg = 8;
%RotMovement = [0:0.1:RotDeg RotDeg:-0.1:-RotDeg -RotDeg:0.1:0];

elements = 0:0.01:Duration;
Amp = RotDeg;
Shift = 0;
Phase = pi;
%Freq = 1/2;%*2*pi*Freq

% Torsion Velocity
tVel = 60; % Degrees/sec
Freq = 360/30; % Time to complete a full cycle

Res = Amp*sin(elements*2*pi/Freq + Phase) + Shift;
RotMovement = Res;
% 
% lenAdjuster = 10;
% 
% for i = 1:lenAdjuster
%     RotMovement = [RotMovement 0:0.5:RotDeg RotDeg:-0.5:-RotDeg -RotDeg:0.5:0];
% end

% Begin Connection
% hexControl.Connect('priapp.csv');

counter = 1;

cmdInvalid = false;

for i=InitialMovement
    [ArmExtensionMMs,validL,~,~,~,~,~] = CalculateArmLength(X, Y, i,...
                                         phi, theta, psi,...
                                         RefX, RefY, RefZ);
    if validL
%         cmdInvalid = hexControl.SendCommand(ArmExtensionMMs(1),...
%                                       ArmExtensionMMs(2),...
%                                       ArmExtensionMMs(3),...
%                                       ArmExtensionMMs(4),...
%                                       ArmExtensionMMs(5),...
%                                       ArmExtensionMMs(6));
    else
        validL
        hexControl.SendCommand(0,0,0,0,0,0)
        break
    end

    if ~cmdInvalid
        allMovement(counter,:) = ArmExtensionMMs;
        counter = counter + 1;
    end
end

for i = RotMovement
    [ArmExtensionMMs,validL,~,~,~,~,~] = CalculateArmLength(X, Y, Ending,...
                                         phi, theta, i,...
                                         RefX, RefY, RefZ);
    if validL
%         cmdInvalid = hexControl.SendCommand(ArmExtensionMMs(1),...
%                                       ArmExtensionMMs(2),...
%                                       ArmExtensionMMs(3),...
%                                       ArmExtensionMMs(4),...
%                                       ArmExtensionMMs(5),...
%                                       ArmExtensionMMs(6));
    else
        validL
        hexControl.SendCommand(0,0,0,0,0,0)
        break
    end

    if ~cmdInvalid
        allMovement(counter,:) = ArmExtensionMMs;
        counter = counter + 1;
    end
end

% %% Timer test
% t = timer('TimerFcn', 'stat=false; disp(''Timer!'');',... 
%                  'StartDelay',10);
% start(t)
% 
% stat=true;
% while(stat==true)
%   disp('.')
%   pause(1)
% end
% hexControl.Disconnect();

%% Timer Functions

ti = timer('ExecutionMode','fixedRate','Period',0.01,'TasksToExecute',length(allMovement));

ti.UserData.counter = 1;
ti.UserData.mvmt = allMovement;
ti.UserData.connection = hexControl;

ti.UserData.connection.Connect('sentMsgs.csv');

ti.TimerFcn = {@theCallbackFunction};

ti.StopFcn = @(~,thisEvent)ti.UserData.connection.Disconnect();

start(ti);

function theCallbackFunction(src, event)
    
    positions = src.UserData.counter;
    cmd = src.UserData.mvmt(positions,:);
    
    src.UserData.counter = positions + 1;
    
    src.UserData.connection.SendCommand(cmd(3), cmd(4), cmd(5),...
                                        cmd(6), cmd(1), cmd(2));
    
end





