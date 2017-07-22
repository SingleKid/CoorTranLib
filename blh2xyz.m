function [ xyz ] = blh2xyz( blh )
%BLH2XYZ 此处显示有关此函数的摘要
%   此处显示详细说明
    xyz = zeros(size(blh,1),3);
    a=6378137.0;
    F=1.0/298.257223563;
    cosb=cos(blh(:,1));
    cosl=cos(blh(:,2));
    sinl=sin(blh(:,2));
    sinb=sin(blh(:,1));
    e2 = 2*F-F*F;
    N = a./sqrt(1-e2*sinb.*sinb);
    xyz(:,1)=(N+blh(:,3)).*cosb.*cosl;
    xyz(:,2)=(N+blh(:,3)).*cosb.*sinl;
    xyz(:,3)=(N*(1-e2)+blh(:,3)).*sinb;

end

