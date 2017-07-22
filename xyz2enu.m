function [enu] = xyz2enu(bl,f1)
%XYZ2ENU  Transformation of [x;y;z] vector from geocentric to local
%   	  system. The local system has origin at (phi, lambda) 
%         that are given in degrees

%Kai Borre 21-07-99
%Copyright (c) by Kai Borre
%$Revision: 2.0 $  $Date: 2001/10/28  $
phi = bl(1,1);
lambda = bl(1,2);
mean_xyz = mean(f1(3:end,:));
enu = zeros(size(f1,1),3);
for i = 3 : size(f1,1)
    x = f1(i,1) - mean_xyz(1,1);
    y = f1(i,2) - mean_xyz(1,2);
    z = f1(i,3) - mean_xyz(1,3);
    cl = cos(lambda);  sl = sin(lambda);
    cb = cos(phi);	    sb = sin(phi);
    F = [-sl -sb*cl cb*cl;
        cl -sb*sl cb*sl;
        0	  cb      sb];
    local_vect = F'*[x; y; z];
    enu(i,1) = local_vect(1);
    enu(i,2) = local_vect(2);
    enu(i,3) = local_vect(3);
end
% file='xian.txt';
% [dx dy dz] = textread(file,'%f %f %f','headerlines',24);
% [e n u]=xyz2enu(34.2207,109.1317,dx,dy,dz)
