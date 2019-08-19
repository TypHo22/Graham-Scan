function  drawHull(HullX,HullY)
%DRAWHULL Summary of this function goes here
%    Plot the wrapping polygon
%% Andreas Bernatzky 19.08.2019
hold(gca,'on');


plot(HullX,HullY,'r','LineStyle','--','LineWidth',2);
lastPartX = [HullX(end);HullX(1)];
lastPartY = [HullY(end);HullY(1)];
plot(lastPartX,lastPartY,'r','LineStyle','--','LineWidth',2);
sz = 50;
scatter(HullX,HullY,sz,'*');
title('Graham-Scan Algorithm for calculating a convex hullpolygon around a pointcloud');
set(gca,'FontSize',16,'FontWeight','bold');
end
