%==========================================================================
% Author: Carl Larsson
% Description: Gets velocity of left wheel
% Date: 2024-04-03

% This software is licensed under the MIT License
% Refer to the LICENSE file for details
%==========================================================================
function vl = get_vl(v, omega, r, l)

vl = (2*v - omega*l)/(2*r);

end