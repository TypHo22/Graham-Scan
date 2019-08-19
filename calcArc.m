function [ArcDeg] = calcArc(Z,point)
%CALCARC Summary of this function goes here
% Calculates the angle between the center point Z and an arbitrary
% point
%% Andreas Bernatzky 19.08.2019
%%
toDeg = 180/pi;
dY = point(2) - Z.y;
dX = point(1) - Z.x;
ArcRad  = atan2(dY,dX); % I calculate I. quadrant =0 to pi/2 , II. quadrant pi
                        % III quadrant -pi, IV quadrant 0 to -pi/2
 % conversion in degree, a case distinction must be made between the upper and lower quadrants                        
if(ArcRad < 0)  
    ArcDeg = 360 - ((abs(ArcRad)/pi)*180);
else
    ArcDeg = ArcRad * toDeg;
end

end

