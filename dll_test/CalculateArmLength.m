function [ArmExtensionMMs, isLengthValid,restingArmLengths, currentArmLengths, Rwp, biw, ai] = CalculateArmLength(X, Y, Z, phi, theta, psi, RefX, RefY, RefZ)
%CALCULATEARMLENGTH takes in desired height and degree rotations, converts
%them to displacement of motor arms.

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
    
    
    % CONSTS
    LongBottom = 146.5; % cm
    ShortBottom = 31.5; % cm
    LongTop = 162; % cm
    ShortTop = 31.5; % cm

    RestHeight = 89; % cm;
    MinArmLength = 114;
    MaxArmLength = 150;

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
        cosd(theta)*cosd(phi)    cosd(theta)*sind(phi)*sind(psi)-sind(theta)*cosd(psi)    cosd(theta)*sind(phi)*cosd(psi)+sind(theta)*sind(psi);...
        sind(theta)*cosd(phi)    sind(theta)*sind(phi)*sind(psi)+cosd(theta)*cosd(psi)    sind(theta)*sind(phi)*cosd(psi)-cosd(theta)*sind(psi);...
        -sind(phi)               cosd(phi)*sind(psi)                                      cosd(phi)*cosd(psi);...
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

    RBottom = sqrt((LongBottom/2).^2 + ((ShortBottom+LongBottom/2).^2)/3);
    DBottom = 2*asind(ShortBottom/2/RBottom);
    RTop = sqrt((LongTop/2).^2 + ((ShortTop+LongTop/2).^2)/3);
    DTop = 2*asind(ShortTop/2/RTop);

    ArmAnglesBottom = 60+[0-DBottom/2 0+DBottom/2 120-DBottom/2 120+DBottom/2 240-DBottom/2 240+DBottom/2];
    ArmAnglesTop = [0-DTop/2 0+DTop/2 120-DTop/2 120+DTop/2 240-DTop/2 240+DTop/2];
    ArmAnglesTop = ArmAnglesTop([2:end 1]);

    % positions of the arms at the bottom
    biw = [RBottom*cosd(ArmAnglesBottom);RBottom*sind(ArmAnglesBottom);zeros(size(ArmAnglesBottom))];
    % positions of the arms at the top
    aip = [RTop*cosd(ArmAnglesTop);RTop*sind(ArmAnglesTop);zeros(size(ArmAnglesTop))];

    % updated positions of the arms at the top
    ai = repmat(x',1,6) + Rwp*(aip-repmat([RefX, RefY, RefZ]',1,6))+repmat([RefX, RefY, RefZ]',1,6);

    %TODO: COMMENT FROM HERE;
    %
    % Once the position of the attachment point ai is determined,
    % the vector Li of link i is simply obtained as
    % Li=aibi (7)
    % where bi is a known 3-vector that represents the coordinates
    % of the base attachment point bi with reference to frame W.
    % The length li of link i will be simply computed from

    % TODO: right now restingArmLengths is calculated based on
    % the RestHeight. But the value should be exactly or
    % very close to MinArmLength. 

    aizero = repmat([0 0 RestHeight]',1,6)+aip; 
    restingArmLengths = sqrt(sum((biw-aizero).*(biw-aizero))); % length of arms at zero position
    currentArmLengths = sqrt(sum((biw-ai).*(biw-ai)));
    isLengthValid = ~(any(currentArmLengths < MinArmLength) || any(currentArmLengths > MaxArmLength));

    ArmExtensionMMs = floor((currentArmLengths-MinArmLength)*10); % convert to mm
end

