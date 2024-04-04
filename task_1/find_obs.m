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

% If no obstacles are detected, give value outside sensor range
% This is beyond threshold (D_wf D_ao) and thus wont affect anything
if numel(obstacle_list) == 0
    x_obs = x + [0;0];
else

    % Take random element as closest (the discrete nature of the map will result in same being chosen always if two obstacles are equal length appart)
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
            if norm(obstacle_list{obstacle}) < norm(obstacle_list{closest})
                closest = obstacle;
            end
        end
    end
    
    % Get global coordinate (obstacle list has relative to robot)
    % Indexes are flipped somehow, resulting in flipped x and y
    % Also, y starts counting from the top, not bottoms, so have to reverse sign
    x_obs = round(x) + [obstacle_list{closest}(2); -obstacle_list{closest}(1)];

end

end