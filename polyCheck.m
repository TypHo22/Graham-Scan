function [polyKruemmung] = polyCheck(P1,P2,P3)
%Definition: One corner pi in a polygon course p0p1, p1p2, ...,  
% pn-1p0 means convex, if for the left angle ? between the edges
% pi-1pi and pipi+1 is 0° less than or equal to ? < 180° (i-1 and i+1 are calculated modulo n). 
%Otherwise the corner is called concave.
% concave = clockwise rotation
% convex = counterclockwise rotation
% I have chosen to determine the cross product,
% whether the polygon course is concave or convex.  If the sum of the cross product does have a negative value
%  then the polygon course is concave. With a positive value for polycrumming the result is
% a convex polygon course
% PolyVal < 0 = concave = clockwise rotation
% PolyVal > 0 = convex = left rotation
% You could also check for convex or concav via the distances P0P1 and P0P2
% Instead of turning to the left or to the right, it is also possible to use a
% curvature will be spoken
%% Andreas Bernatzky 19.08.2019
%%
% f = [P1;P2;P3];
% figure(2);
% scatter(f(:,1),f(:,2),'filled');
P1P2 = sqrt((P2(1)-P1(1))^2 + (P2(2)-P1(2))^2 );%length of the route
P1P3 = sqrt((P3(1)-P1(1))^2 + (P3(2)-P1(2))^2 );%length of the route
P1P2Vec = [(P2(1)-P1(1));(P2(2)-P1(2));0]; %vector set up tip minus foot
P1P3Vec = [(P3(1)-P1(1));(P3(2)-P1(2));0]; %vector set up tip minus foot
%% P1P2Vec P1P3Vec
crossP = cross(P1P2Vec,P1P3Vec);
polyKruemmung = crossP(1)+crossP(2)+crossP(3);
end

