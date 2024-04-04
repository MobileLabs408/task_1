%==========================================================================
% Author: Carl Larsson
% Description: Find x_obs.
% Date: 2024-04-03

% This software is licensed under the MIT License
% Refer to the LICENSE file for details
%==========================================================================
function x_obs = find_obs(sensor_matrix, x)

% Save all relative coordinates (to the robot) where obstacles are found
obstacle_list = {};

% loop through entire matrix to search for obstacles
for row = 1:5
    for column = 1:5
        % 0 is obstacle
        if sensor_matrix(row,column) == 0
            % Convert to relative coordinate where robot is in center, (3,3)
            obstacle_list{end+1} = [row;column] - [3;3];
        end
    end
end

% Take first element as best to begin with
closest = 1;
% Find closest obstacle (will always result in orthogonal)
for obstacle = 1:numel(obstacle_list)
    if norm(x-obstacle_list{obstacle}) < norm(x-obstacle_list{closest})
        closest = obstacle;
    end
end

if numel(obstacle_list) ~= 0
    % Get global coordinate (obstacle list has relative to robot)
    x_obs = x + obstacle_list{closest};
else
    x_obs = x + [3;3];
end

end