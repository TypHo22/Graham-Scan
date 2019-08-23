function [KonvexHullPoints] = GrahamScanAlgorithm(points)
%GRAHAMASCANALGORITHM Summary of this function goes here
%   https://en.wikipedia.org/wiki/Graham_scan
%   Graham's scan is a method of finding the convex hull of a finite set of points
%   in the plane with time complexity O(n log n). It is named after Ronald Graham, who published
%   the original algorithm in 1972.[1] The algorithm finds all vertices of the convex hull ordered along its boundary.
%   It uses a stack to detect and remove concavities in the boundary efficiently.
%   Implementation of the grahamAlgorithm. The Graham Algorithm calculates
%   a convex polygon around a pointCloud
%   Input: nx2 points (x,y)
%   Output: KonvexHullPoints (x,y)
%% Andreas Bernatzky 19.08.2019
%% calc center (own Method)
xMax = max(points(:,1));
xMin = min(points(:,1));
yMax = max(points(:,2));
yMin = min(points(:,2));

Z.x = xMin + (xMax-xMin)/2;
Z.y = yMin + (yMax-yMin)/2;
% scatter(Z.x,Z.y,'*'); %turn on for visualisation of center point

%% calculate all arcs between the randpoints and center Z
degHold = []; %holds all the degrees 
for(a=1:1:length(points))
    degHold(end+1) = calcArc(Z,points(a,:));
end
degHold = transpose(degHold);

%% Sort Points 
pointIndice = transpose(1:1:length(points));
degHold = table(degHold, pointIndice,points(:,1),points(:,2));
degHoldSort = sortrows(degHold,'degHold','ascend');
degHoldSort.Properties.VariableNames{3} = 'x';
degHoldSort.Properties.VariableNames{4} = 'y';
KonvexHull = degHoldSort;
%% Calculate Convex Hull
noMoreRemove = false; %condition for staying in while-loop
k = 1;% Increment
cas = 0; % case 

while(noMoreRemove == false ) %stay in while until no points need to be removed anymore
    if(k<=height(KonvexHull)-2)%standard case far away from the vector end
        P1 = [KonvexHull{k,3},KonvexHull{k,4}];
        P2 = [KonvexHull{k+1,3},KonvexHull{k+1,4}];
        P3 = [KonvexHull{k+2,3},KonvexHull{k+2,4}];
        cas = 0;
    elseif(k==height(KonvexHull)-1)%k is the penultimate element must now be k+1 = last vector element and k+2 == 1st vector element
        P1 = [KonvexHull{k,3},KonvexHull{k,4}];
        P2 = [KonvexHull{k+1,3},KonvexHull{k+1,4}];
        P3 = [KonvexHull{1,3},KonvexHull{1,4}];
        cas = 0;
    elseif(k==height(KonvexHull))%k is the last element must now be k+1 == 1st vector element and k+2 == 2nd vector element 
        P1 = [KonvexHull{k,3},KonvexHull{k,4}];
        P2 = [KonvexHull{1,3},KonvexHull{1,4}];
        P3 = [KonvexHull{2,3},KonvexHull{2,4}];
        cas = 1;
    end
    polyTest = polyCheck(P1,P2,P3);
    
    if(polyTest <= 0 && cas == 0)% concave must be remove
        KonvexHull(k+1,:) = []; %remove
        k = 0;
    elseif(polyTest < 0 && cas == 1)
        KonvexHull(1,:) = []; %remove
        k = 0;
    elseif(polyTest == 0)
        zerCount = zerCount + 1;
    elseif(k==height(KonvexHull)&&polyTest>0)     
            noMoreRemove = true;
            break;
    end
    k = k+1;
end

KonvexHullPoints = [KonvexHull{:,3},KonvexHull{:,4}];
end

