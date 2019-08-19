%% Graham-Scan
%   https://en.wikipedia.org/wiki/Graham_scan
%   Graham's scan is a method of finding the convex hull of a finite set of points
%   in the plane with time complexity O(n log n). It is named after Ronald Graham, who published
%   the original algorithm in 1972.[1] The algorithm finds all vertices of the convex hull ordered along its boundary.
%   It uses a stack to detect and remove concavities in the boundary efficiently.
% http://www.dbs.ifi.lmu.de/Lehre/GIS/WS1415/Skript/GIS_WS14_05_part2.pdf
% (GERMAN)
%% Andreas Bernatzky 19.08.2019
%%
clear all;
close all;
%% Example Points choose section A or section B
%% SECTION A create random point cloud
pointAmount = 600;
points = rand(pointAmount,2);
%% SECTION B create random points along a sine sine 
x = -10:1:10;
y = sin(x);
xRanSine  = [];
yRanSine =[];
for(a=1:1:length(x))
   xRanSine = [xRanSine, rand(1,25) + x(a)];
   yRanSine = [yRanSine, rand(1,25) + y(a)];
end
points = [xRanSine' , yRanSine'];
%% Visualise RandomCloudpoint
scatter(points(:,1),points(:,2),'filled'); % visualise random point cloud
hold on;
% visualise center
xMax = max(points(:,1));
xMin = min(points(:,1));
yMax = max(points(:,2));
yMin = min(points(:,2));
%% Visualise Centerpoint (Centerpoint will be calculated again in the actual Algorithm
Z.x = xMin + (xMax-xMin)/2;
Z.y = yMin + (yMax-yMin)/2;
scatter(Z.x,Z.y,'*'); 
text(Z.x,Z.y,'Centerpoint');
%% Actual Algorithm
konvexHullPoints = GrahamScanAlgorithm(points);
%% Visualise konvex Hull
drawHull(konvexHullPoints(:,1),konvexHullPoints(:,2));
