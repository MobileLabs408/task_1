%==========================================================================
% Author: Carl Larsson
% Description: Find index for smallest sensor reading.
% Date: 2024-04-03

% This software is licensed under the MIT License
% Refer to the LICENSE file for details
%==========================================================================
function [rowidx,colidx] = find_idx(sensor_matrix)

min_value = min(sensor_matrix(:));

[rowidx, colidx] = find(sensor_matrix == min_value);

end