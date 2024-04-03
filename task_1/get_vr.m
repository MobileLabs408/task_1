%==========================================================================
% Author: Carl Larsson
% Description: Gets velocity of right wheel
% Date: 2024-04-03

% This software is licensed under the MIT License
% Refer to the LICENSE file for details
%==========================================================================
function vr = get_vr(v, omega, r, l)

vr = (2*v + omega*l)/(2*r);

end