%==========================================================================
% Author: Carl Larsson
% Description: Differential drive model obtain x, y and theta
% Date: 2024-04-03

% This software is licensed under the MIT License
% Refer to the LICENSE file for details
%==========================================================================
function [xdot, ydot, thetadot] = differential_drive_xytheta(vl, vr, theta, r, l)

xdot = (r/2) * (vr + vl) * cos(theta);
ydot = (r/2) * (vr + vl) * sin(theta);
thetadot = (r/l) * (vr - vl);

end