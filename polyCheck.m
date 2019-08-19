function [polyKruemmung] = polyCheck(P1,P2,P3)
%Definition:  Eine Ecke pi in einem Polygonzug p0p1,  p1p2, ...,  
% pn-1p0 heißt konvex, wenn für den links liegenden Winkel ? zwischen den Kanten
% pi-1pi und pipi+1 gilt 0° kleiner gleich ? < 180° (i-1 und i+1 werden modulo n gerechnet). 
% Anderenfalls heißt die Ecke konkav.
% konkav = rechtsdrehung
% konvex = linksdrehung
% Ich habe mich dafuer entschieden ueber die Dreiecksflaeche zu bestimmen,
% ob der Polygonzug konkav oder konvex ist. Hierzu bedient man sich dem
% Kreuzprodukt. Wenn die Werte des Kreuzprodukts addiert einen negativen Wert
% fuer polyKruemmung ergeben, dann ist der Polygonzug konkav. Bei einem positiven Wert fuer polyKruemmung ergibt sich
% ein konvexer Polygonzug
% PolyVal < 0 = konkav = rechtsdrehung
% PolyVal > 0 = konvex = linksdrehung
% Anstelle von linksdrehung oder rechtsdrehung kann auch von einer
% kruemmnung gesprochen werden
%% Andreas Bernatzky 19.08.2019
%%
% f = [P1;P2;P3];
% figure(2);
% scatter(f(:,1),f(:,2),'filled');
P1P2 = sqrt((P2(1)-P1(1))^2 + (P2(2)-P1(2))^2 );%laenge der strecke
P1P3 = sqrt((P3(1)-P1(1))^2 + (P3(2)-P1(2))^2 );%laenge der strecke
P1P2Vec = [(P2(1)-P1(1));(P2(2)-P1(2));0]; %vektor aufstellen spitze minus fuss
P1P3Vec = [(P3(1)-P1(1));(P3(2)-P1(2));0]; % vektor aufstellen spitze minus fuss
%% P1P2Vec P1P3Vec
crossP = cross(P1P2Vec,P1P3Vec);
polyKruemmung = crossP(1)+crossP(2)+crossP(3);
end

