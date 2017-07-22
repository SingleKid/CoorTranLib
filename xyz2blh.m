function [ blh ] = xyz2blh( f1 )
    blh = zeros(size(f1,1),3);
	a = 6378137.0;
	F = 1.0 / 298.257223563;
	%	const SpaceLocation * xyz = this;
	%	BLHLocation blh;
    for i = 1 : size(f1,1)
        e2 = 0;
        Z = 0;
        dZ = 0;
        ZdZ = 0;
        r = 0;
        sinb = 0;
        N = 0;
        x2y2 = 0;
		iter = 0;
		r = 0.0;
		N = 0.0;
		sinb = 0.0;
		e2 = 2 * F - F * F;
		x2y2 = f1(i,1) * f1(i,1) + f1(i,2) * f1(i,2);
		dZ = e2 * f1(i,3);
		while ((iter <= 10) && (abs(dZ - Z) > 1E-8))
			Z = dZ;
			ZdZ = Z + f1(i,3);
			r = x2y2 + ZdZ*ZdZ;
			sinb = ZdZ / sqrt(r);
			N = a / sqrt(1 - e2*sinb*sinb);
			dZ = N * e2 * sinb;
			iter = iter + 1;
        end
		blh(i,1) = atan2(f1(i,2), f1(i,1));
		blh(i,2) = atan2(ZdZ, sqrt(x2y2));
		blh(i,3) = sqrt(x2y2 + ZdZ*ZdZ) - N;
        
    end
end

