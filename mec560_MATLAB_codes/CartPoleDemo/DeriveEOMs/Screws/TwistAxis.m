function l = TwistAxis(zeta)
if isHomogeneousTwist(zeta)
    zeta = HomogeneousToTwist(zeta);
elseif ~isvector(zeta) || size(zeta,1) ~= 6
    error('Input should be a 6 x 1 vector');
end
v = zeta(1:3);
w = zeta(4:6);
if isZero(w)
    l = [0;0;0;v/sqrt(v.'*v)];
    return;
end
q = AxisToSkew(w)*v/(w.'*w);
l = [q;w/sqrt(w.'*w)];
