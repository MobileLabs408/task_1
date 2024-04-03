%==========================================================================
% Author: Carl Larsson
% Description: Find ao vector.
% Date: 2024-04-03

% This software is licensed under the MIT License
% Refer to the LICENSE file for details
%==========================================================================
function ao_vector = find_ao(x, sensor_matrix)

[~, index] = min(sensor_matrix);

[rowidx, colidx] = ind2sub(size(sensor_matrix), index);

distance_cell = {[-2;2],  [-1;2],  [0;2],  [1;2],  [2;2];
                 [-2;1],  [-1;1],  [0;1],  [1;1],  [2;1];
                 [-2;0],  [-1;0],  [0;0],  [1;0],  [2;0];
                 [-2;-1], [-1;-1], [0;-1], [1;-1], [2;-1];
                 [-2;-2], [-1;-2], [0;-2], [1;-2], [2;-2]};

distance_matrix = reshape(distance_cell, 5, 5);

ao_vector = x + distance_matrix{1, 1};

end