%==========================================================================
% Author: Carl Larsson
% Description: Find x_obs.
% Date: 2024-04-03

% This software is licensed under the MIT License
% Refer to the LICENSE file for details
%==========================================================================
function x_obs = find_obs(sensor_matrix, x)

% Save all global coordinates (to the robot) where obstacles are found
obstacle_list = {};

% loop through entire matrix to search for obstacles
for row = 1:5
    for column = 1:5
        % 0 is obstacle
        if sensor_matrix(row,column) == 0
            % Convert to global coordinates.
            % Note that robot is in center, (3,3), in local coordinates,
            % therefor have to subtract it so robot is "the center".
            % 
            % Shift row (y) and column (x) so format is [x;y]
            %
            % Also, y starts counting from the top, not bottom, 
            % so have to reverse sign (- on second element)
            temp = [column;row] - [3;3];
            obstacle_list{end+1} = round((x + [temp(1);-temp(2)])*10)/10;
        end
    end
end

% If no obstacles are detected, give value robot position
% This wont affect behavior since it results in dot product = 0
if numel(obstacle_list) == 0
    x_obs = x + [0;0];
else

    % Take first element as closest
    closest = 1;
    % Unless it is the robots own position
    if norm(obstacle_list{closest}) == 0
        % Then take last element
        closest = numel(obstacle_list);
    end
    % Find closest obstacle (will always result in orthogonal)
    for obstacle = 1:numel(obstacle_list)
        % Best is not allowed to be the robots own position
        if(norm(obstacle_list{obstacle}) ~= 0)
            if norm(x-obstacle_list{obstacle}) < norm(x-obstacle_list{closest})
                closest = obstacle;
            end
        end
    end
    
    % Provide closest obstacle global position
    x_obs = obstacle_list{closest};

end

end