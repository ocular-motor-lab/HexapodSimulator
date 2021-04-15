classdef HexapodSimulator < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure          matlab.ui.Figure
        UIAxes            matlab.ui.control.UIAxes
        XSliderLabel      matlab.ui.control.Label
        XSlider           matlab.ui.control.Slider
        YSliderLabel      matlab.ui.control.Label
        YSlider           matlab.ui.control.Slider
        ZSliderLabel      matlab.ui.control.Label
        ZSlider           matlab.ui.control.Slider
        phiSliderLabel    matlab.ui.control.Label
        phiSlider         matlab.ui.control.Slider
        thetaSliderLabel  matlab.ui.control.Label
        thetaSlider       matlab.ui.control.Slider
        psiSliderLabel    matlab.ui.control.Label
        psiSlider         matlab.ui.control.Slider
        ConnectCs         matlab.ui.control.Button
        ResetButton       matlab.ui.control.Button
        
        ArmLengthLabel    matlab.ui.control.Label
        hexapod
    end
    
    properties (Constant=true)
        LongBottom = 146.5; % cm
        ShortBottom = 31.5; % cm
        LongTop = 162; % cm
        ShortTop = 31.5; % cm
        
        RestHeight = 89; % cm;
        
        MinArmLength = 114;
        MaxArmLength = 150;
    end

    % Callbacks that handle component events
    methods (Access = private)

        function UpdateGraph(app, X,Y,Z,phi,theta, psi)
            
            euler_angles = [phi, theta, psi];
            position = [X,Y,Z];
            
            
            % Since each of the six links of the Stewart Platform is attached to the
            % base and the moving platform at known points, the joint space kinematics
            % of the mechanism are easily determined if the moving platform position
            % and orientation are known. This explains the simplicity of the inverse
            % kinematic problem for this type of mechanism. To describe the kinematics
            % of the moving platform, we will need two coordinate systems as depicted
            % in Figure 1. The world coordinate frame W is fixed to the base while the
            % coordinate frame P is attached to the moving platform at a reference
            % point po. The position of frame P is specified with reference to frame W
            % by a vector
            
            x =[X, Y, Z];
            
            % which gives the coordinates of point po with
            % reference to frame W. The orientation of frame P is described with
            % reference to frame W by a rotation matrix Rwp = (r1, r2, r3), where r1,
            % r2 and r3 are, respectively, 3x1 unit vectors along the axes of frame P
            % and described with reference to frame W. The rotation matrix Rwp is
            % derived in term of the three Euler angles in the next section.
            % We define a generalized coordinate vector q, whose elements are the six
            % variables chosen to describe the  position and orientation of the
            % platform, as
            
            q = [X, Y, Z, phi, theta, psi];
            
            % The joint space coordinate vector l is defined as
            
            % l = [l1, l2, l3, l4, l5, l6];
            
            % where li for i=1, . . . , 6 are the lengths of the six numbered links of
            % the Stewart Platform. In the following sections, the mapping between
            % these two sets of coordinates and their time derivatives will be
            % presented.
            
            %
            % KINEMATICS OF THE MOVING PLAFFORM
            %
            
            % The mapping between the x-y-z coordinates (or the platform coordinate
            % frame P) and the X'-Y'-Z' coordinates is achieved through a 3x3 rotation
            % matrix Rwp involving the three Euler angles phi, theta, psi. Rwp is
            % given for the used Euler angle representation as
            %             
            %             Rwp = [  ...
            %                 cosd(psi)*cosd(phi)-cosd(theta)*sind(phi)*sind(psi)      -sind(psi)*cosd(phi)-cosd(theta)*sind(phi)*cosd(psi)    sind(theta)*sind(phi);...
            %                 cosd(psi)*sind(phi)+cosd(theta)*cosd(phi)*sind(psi)      -sind(psi)*sind(phi)+cosd(theta)*cosd(phi)*cosd(psi)   -sind(theta)*cosd(phi);...
            %                 sind(psi)*sind(theta)                                    cosd(psi)*sind(theta)                                     cosd(theta);...
            %                 ];

            % JORGE: this parametrization is not good for us. Has two axes
            % of rotation that are the same (one earth fixed and one that
            % moves). But at resting state they are redundant.
            % instead using the FICK rotation matrix from Mathematics of
            % three-dimensional eye rotation. ThomasHaslwanter. Vision
            % Research Volume 35, Issue 12, June 1995, Pages 1727-1739 


             
            Rwp = [  ...
                
                cosd(theta)*cosd(phi)         cosd(theta)*sind(phi)*sind(psi)-sind(theta)*cosd(psi)        cosd(theta)*sind(phi)*cosd(psi)+sind(theta)*sind(psi);...
                sind(theta)*cosd(phi)         sind(theta)*sind(phi)*sind(psi)+cosd(theta)*cosd(psi)        sind(theta)*sind(phi)*cosd(psi)-cosd(theta)*sind(psi);...
                -sind(phi)                   cosd(phi)*sind(psi)                                       cosd(phi)*cosd(psi);...
                ];
            
            %
            % INVERSE KINEMATICS
            %
            %The inverse kinematic problem of the Stewart Platform is concerned with
            %the determination of the displacements of the six links and their time
            %derivatives corresponding to a given Cartesian pose of the moving platform
            %in terms of three positional displacements and three Euler angular
            %displacements and their time derivatives. In the following sections,
            %closed form solutions for the inverse position, rate and acceleration
            %kinematics are presented.
            %
            % Inverse position kinematics Referring back to Figure 1, the coordinates
            % of the ith  attachment point ai on the moving platform, given with
            % reference to frame P as ai=(xai, yai, zai)', are obtained with
            % reference to the world coordinate system W by using
            
            
            % JORGE: here we define the dimensions of the platforms and the location of
            % the arms. All arms are located at the same radial distance from a center
            % but are grouped in pairs. So one arm will be at D degrees angular
            % separation from the next one and 120-D from the previous one. Said another
            % way, we can think that there are 2 sets of 3 arms, in each of them all
            % arms are separated by 120 degrees and the two sets are offset by D
            % degrees.
            % Because it is easier to measure, instead of the angles we
            % measured the distances between arms. Short distance and long
            % distance
            
            

            RBottom = sqrt((app.LongBottom/2).^2 + ((app.ShortBottom+app.LongBottom/2).^2)/3);
            DBottom = 2*asind(app.ShortBottom/2/RBottom);
            RTop = sqrt((app.LongTop/2).^2 + ((app.ShortTop+app.LongTop/2).^2)/3);
            DTop = 2*asind(app.ShortTop/2/RTop);
            
            ArmAnglesBottom = [0-DBottom/2 0+DBottom/2 120-DBottom/2 120+DBottom/2 240-DBottom/2 240+DBottom/2];
            ArmAnglesTop = -60+[0-DTop/2 0+DTop/2 120-DTop/2 120+DTop/2 240-DTop/2 240+DTop/2];
            ArmAnglesTop = ArmAnglesTop([2:end 1]);
            
            % positions of the arms at the bottom
            biw = [RBottom*cosd(ArmAnglesBottom);RBottom*sind(ArmAnglesBottom);zeros(size(ArmAnglesBottom))];
            % positions of the arms at the top
            aip = [RTop*cosd(ArmAnglesTop);RTop*sind(ArmAnglesTop);zeros(size(ArmAnglesTop))];
            
            % updated positions of the arms at the top
            ai = repmat(x',1,6) + Rwp*aip;
            
            %TODO: COMMENT FROM HERE;
            
            
            %
            % Once the position of the attachment point ai is determined,
            % the vector Li of link i is simply obtained as
            % Li=aibi (7)
            % where bi is a known 3-vector that represents the coordinates
            % of the base attachment point bi with reference to frame W.
            % The length li of link i will be simply computed from
            
            
            % TODO: right now restingArmLengths is calculated based on
            % the app.RestHeight. But the value should be exactly or
            % very close to app.MinArmLength. 
            
            aizero = repmat([0 0 app.RestHeight]',1,6)+aip; 
            restingArmLengths = sqrt(sum((biw-aizero).*(biw-aizero))); % length of arms at zero position
            currentArmLengths = sqrt(sum((biw-ai).*(biw-ai)));
            isLengthValid = ~(any(currentArmLengths < app.MinArmLength) || any(currentArmLengths > app.MaxArmLength));
            
            ArmExtensionMMs = floor((currentArmLengths-app.MinArmLength)*10); % convert to mm
            disp(ArmExtensionMMs);
                    
            
            % update the drawing
            cla(app.UIAxes);
            
            % draw the RGB reference frame
            colors = 'rgb';
            for i=1:3
                line(app.UIAxes,X+[0 Rwp(1,i)]*20,Y+[0 Rwp(2,i)]*20,Z+[0 Rwp(3,i)]*20,'linewidth',2,'color',colors(i));
            end
            
            % draw the planes of the platform
            set(app.UIAxes, 'nextplot','add');
            patch(app.UIAxes, biw(1,[end 1:end]), biw(2,[end 1:end]), biw(3,[end 1:end]),[0.3 0.3 0.3])
            scatter3(app.UIAxes,biw(1,:), biw(2,:), biw(3,:),'linewidth',2)
            patch(app.UIAxes,ai(1,[end 1:end]), ai(2,[end 1:end]), ai(3,[end 1:end]),[0.6 0.6 0.6])
            scatter3(app.UIAxes,ai(1,:), ai(2,:), ai(3,:),'linewidth',2)
            
            % draw the arms of the platform
            for i=1:6
                lzero = biw + (ai - biw).*restingArmLengths./currentArmLengths;
                
                line(app.UIAxes,[biw(1,i) lzero(1,i)],[biw(2,i) lzero(2,i)],[biw(3,i) lzero(3,i)],'linewidth',4,'color','green');
                line(app.UIAxes,[lzero(1,i) ai(1,i)],[lzero(2,i) ai(2,i)],[lzero(3,i) ai(3,i)],'linewidth',2,'color','red');
            end
            
            % change the background
            if ( isLengthValid )
                app.UIAxes.Color = 'white';
            else
                app.UIAxes.Color = [1 0.5 0.5];
            end
            
            % add text for each arm
            for i=1:6
                text(app.UIAxes, ai(1,i), ai(2,i), ai(3,i)+5, num2str(i), 'fontsize',20,'BackgroundColor','w');
                text(app.UIAxes, biw(1,i), biw(2,i), biw(3,i)+5, num2str(i),'fontsize',20,'BackgroundColor','w');
            end
            app.ArmLengthLabel.Text = ['Arm extension = ' num2str(ArmExtensionMMs)];
            
            
            % send commands to hexapod
            if ( isLengthValid )
                if ~(isempty(app.hexapod))
                    app.hexapod.constructPacket(ArmExtensionMMs(5), ArmExtensionMMs(6), ArmExtensionMMs(1), ArmExtensionMMs(2), ArmExtensionMMs(3), ArmExtensionMMs(4))
                end
            end
        end
        
        % Value changed function: XSlider, YSlider, ZSlider, 
        % phiSlider, psiSlider, thetaSlider
        function SliderValueChanged(app, event)
            
            X = app.XSlider.Value;
            Y = app.YSlider.Value;
            Z = app.ZSlider.Value;
            
            phi = app.phiSlider.Value;
            theta = app.thetaSlider.Value;
            psi = app.psiSlider.Value;
            
            if ( strcmp(event.EventName, 'ValueChanging'))
                if ( event.Source == app.XSlider)
                    X = event.Value;
                elseif ( event.Source == app.YSlider)
                    Y = event.Value;
                elseif ( event.Source == app.ZSlider)
                    Z = event.Value;
                elseif ( event.Source == app.phiSlider)
                    phi = event.Value;
                elseif ( event.Source == app.thetaSlider)
                    theta = event.Value;
                elseif ( event.Source == app.psiSlider)
                    psi = event.Value;
                end
            end
            app.UpdateGraph(X,Y,Z,phi, theta, psi);
        end
        
        % Button pushed function: ConnectCs
        function ConnectCsPushed(app, event)
            if ( ~isempty(app.hexapod) )
                app.hexapod.connectUDP();
            end
        end
        

        % Button pushed function: ResetButton
        function ResetButtonPushed(app, event)
            
            app.XSlider.Value = 0;
            app.YSlider.Value = 0;
            app.ZSlider.Value = app.RestHeight;
            
            app.phiSlider.Value = 0;
            app.thetaSlider.Value = 0;
            app.psiSlider.Value = 0;
            
            X = app.XSlider.Value;
            Y = app.YSlider.Value;
            Z = app.ZSlider.Value;
            
            phi = app.phiSlider.Value;
            theta = app.thetaSlider.Value;
            psi = app.psiSlider.Value;
            
            if ~(isempty(app.hexapod))
                app.hexapod.Reset()
            end
            
            app.UpdateGraph(X,Y,Z,phi, theta, psi);
        end
    end
    
    %% Constructor
    methods
        function app = HexapodSimulator(  )
            
            if ( exist('C:\Users\raulr\Documents\Unity Projects\HexapodSimulator\ClassLibrary1.dll', 'file') )
                asm = NET.addAssembly('C:\Users\raulr\Documents\Unity Projects\HexapodSimulator\ClassLibrary1.dll');
                app.hexapod = ClassLibrary1.Class1;
            end
            
            app.createComponents();
            
            X = app.XSlider.Value;
            Y = app.YSlider.Value;
            Z = app.ZSlider.Value;
            
            phi = app.phiSlider.Value;
            theta = app.thetaSlider.Value;
            psi = app.psiSlider.Value;
            
            app.UpdateGraph(X,Y,Z,phi, theta, psi);
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Position = [100 100 640 580];
            app.UIFigure.Name = 'UI Figure';

            % Create UIAxes
            app.UIAxes = uiaxes(app.UIFigure);
            title(app.UIAxes, 'Title')
            xlabel(app.UIAxes, 'X')
            ylabel(app.UIAxes, 'Y')
            app.UIAxes.Projection = 'perspective';
            app.UIAxes.View = [45 30];
            app.UIAxes.Position = [1 51 378 405];
            app.UIAxes.XLim = [-120 120];
            app.UIAxes.YLim = [-120 120];
            app.UIAxes.ZLim = [-10 160];

            % Create XSliderLabel
            app.XSliderLabel = uilabel(app.UIFigure);
            app.XSliderLabel.HorizontalAlignment = 'right';
            app.XSliderLabel.Position = [412 434 25 22];
            app.XSliderLabel.Text = 'X';

            % Create XSlider
            app.XSlider = uislider(app.UIFigure);
            app.XSlider.Limits = [-30 30];
            app.XSlider.ValueChangedFcn = createCallbackFcn(app, @SliderValueChanged, true);
            app.XSlider.ValueChangingFcn = createCallbackFcn(app, @SliderValueChanged, true);
            app.XSlider.Position = [458 443 150 3];

            % Create YSliderLabel
            app.YSliderLabel = uilabel(app.UIFigure);
            app.YSliderLabel.HorizontalAlignment = 'right';
            app.YSliderLabel.Position = [412 383 25 22];
            app.YSliderLabel.Text = 'Y';

            % Create YSlider
            app.YSlider = uislider(app.UIFigure);
            app.YSlider.Limits = [-30 30];
            app.YSlider.ValueChangedFcn = createCallbackFcn(app, @SliderValueChanged, true);
            app.YSlider.ValueChangingFcn = createCallbackFcn(app, @SliderValueChanged, true);
            app.YSlider.Position = [458 392 150 3];

            % Create ZSliderLabel
            app.ZSliderLabel = uilabel(app.UIFigure);
            app.ZSliderLabel.HorizontalAlignment = 'right';
            app.ZSliderLabel.Position = [412 341 25 22];
            app.ZSliderLabel.Text = 'Z';

            % Create ZSlider
            app.ZSlider = uislider(app.UIFigure);
            app.ZSlider.Limits = [80 140];
            app.ZSlider.ValueChangedFcn = createCallbackFcn(app, @SliderValueChanged, true);
            app.ZSlider.ValueChangingFcn = createCallbackFcn(app, @SliderValueChanged, true);
            app.ZSlider.Position = [458 350 150 3];
            app.ZSlider.Value = app.RestHeight;

            % Create phiSliderLabel
            app.phiSliderLabel = uilabel(app.UIFigure);
            app.phiSliderLabel.HorizontalAlignment = 'right';
            app.phiSliderLabel.Position = [412 241 25 22];
            app.phiSliderLabel.Text = 'phi';

            % Create phiSlider
            app.phiSlider = uislider(app.UIFigure);
            app.phiSlider.Limits = [-30 30];
            app.phiSlider.ValueChangedFcn = createCallbackFcn(app, @SliderValueChanged, true);
            app.phiSlider.ValueChangingFcn = createCallbackFcn(app, @SliderValueChanged, true);
            app.phiSlider.Position = [458 250 150 3];

            % Create thetaSliderLabel
            app.thetaSliderLabel = uilabel(app.UIFigure);
            app.thetaSliderLabel.HorizontalAlignment = 'right';
            app.thetaSliderLabel.Position = [405 192 32 22];
            app.thetaSliderLabel.Text = 'theta';

            % Create thetaSlider
            app.thetaSlider = uislider(app.UIFigure);
            app.thetaSlider.Limits = [-30 30];
            app.thetaSlider.ValueChangedFcn = createCallbackFcn(app, @SliderValueChanged, true);
            app.thetaSlider.ValueChangingFcn = createCallbackFcn(app, @SliderValueChanged, true);
            app.thetaSlider.Position = [458 201 150 3];

            % Create psiSliderLabel
            app.psiSliderLabel = uilabel(app.UIFigure);
            app.psiSliderLabel.HorizontalAlignment = 'right';
            app.psiSliderLabel.Position = [412 141 25 22];
            app.psiSliderLabel.Text = 'psi';

            % Create psiSlider
            app.psiSlider = uislider(app.UIFigure);
            app.psiSlider.Limits = [-30 30];
            app.psiSlider.ValueChangedFcn = createCallbackFcn(app, @SliderValueChanged, true);
            app.psiSlider.ValueChangingFcn = createCallbackFcn(app, @SliderValueChanged, true);
            app.psiSlider.Position = [458 150 150 3];
            
            % Create Connect Button     
            app.ConnectCs = uibutton(app.UIFigure, 'push');
            app.ConnectCs.ButtonPushedFcn = createCallbackFcn(app, @ConnectCsPushed, true);
            app.ConnectCs.Position = [475 70 100 22];
            app.ConnectCs.Text = 'Connect';

            % Create ResetButton
            app.ResetButton = uibutton(app.UIFigure, 'push');
            app.ResetButton.ButtonPushedFcn = createCallbackFcn(app, @ResetButtonPushed, true);
            app.ResetButton.Position = [475 41 100 22];
            app.ResetButton.Text = 'Reset';
            
            
            % Create ArmLengthLabel
            app.ArmLengthLabel = uilabel(app.UIFigure);
            app.ArmLengthLabel.HorizontalAlignment = 'left';
            app.ArmLengthLabel.Position = [11 530 378 50];
            app.ArmLengthLabel.Text = 'ARM length=';

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end
    


    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = test2
            
            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end