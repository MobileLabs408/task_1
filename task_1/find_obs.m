%==========================================================================
% Author: Carl Larsson
% Description: Find x_obs.
% Date: 2024-04-03

% This software is licensed under the MIT License
% Refer to the LICENSE file for details
%==========================================================================
function x_obs = find_obs(rowidx, colidx, x)

distance_cell = {[-2;2],  [-1;2],  [0;2],  [1;2],  [2;2];
                 [-2;1],  [-1;1],  [0;1],  [1;1],  [2;1];
                 [-2;0],  [-1;0],  [0;0],  [1;0],  [2;0];
                 [-2;-1], [-1;-1], [0;-1], [1;-1], [2;-1];
                 [-2;-2], [-1;-2], [0;-2], [1;-2], [2;-2]};

distance_matrix = reshape(distance_cell, 5, 5);

x_obs = x + distance_matrix{rowidx, colidx};

end