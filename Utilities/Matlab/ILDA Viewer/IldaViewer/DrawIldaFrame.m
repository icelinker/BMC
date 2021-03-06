% Copyright 2020 Scrootch.me!
% 
% Licensed under the Apache License, Version 2.0 (the "License");
% you may not use this file except in compliance with the License.
% You may obtain a copy of the License at
% 
%    http://www.apache.org/licenses/LICENSE-2.0
%
% Unless required by applicable law or agreed to in writing, software
% distributed under the License is distributed on an "AS IS" BASIS,
% WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
% See the License for the specific language governing permissions and
% limitations under the License.

% DrawIldaFrame
% Plot an IldaFrame
% Inputs: 
%     x, y, z, status, and color information
% Optional Inputs:
%     showBlanked (0 or 1) to show blanked points
%     view3D (0 or 1) to show in 3D
%     target axes to plot to

function DrawIldaFrame(x, y, z, s, c, showBlanked, view3D, target)

    % If no target, set to current axis
    if ~exist('target', 'var')
        figure;
        target = gca;
        hold on;
    end
    
    % If showBlanked doesn't exist, set to no
    if ~exist('showBlanked', 'var')
        showBlanked = 0;
    end
    
    % If view3D doesn't exist, set to 2D
    if ~exist('view3D', 'var')
        view3D = 0;
    end
    
    % ILDA color palette
    colors = [ 255 0 0; ...
               255 16 0; ...
               255 32 0; ...               
               255 48 0; ...               
               255 64 0; ...
               255 80 0; ...               
               255 96 0; ...               
               255 112 0; ...               
               255 128 0; ...               
               255 144 0; ...               
               255 160 0; ...               
               255 176 0; ...               
               255 192 0; ...               
               255 208 0; ...               
               255 224 0; ...               
               255 240 0; ... 
               255 255 0; ... 
               224 255 0; ... 
               192 255 0; ... 
               160 255 0; ... 
               128 255 0; ... 
               96 255 0; ... 
               64 255 0; ... 
               32 255 0; ... 
               0 255 0; ... 
               0 255 36; ... 
               0 255 73; ... 
               0 255 109; ... 
               0 255 146; ... 
               0 255 182; ... 
               0 255 219; ... 
               0 255 255; ... 
               0 227 255; ... 
               0 198 255; ... 
               0 170 255; ... 
               0 142 255; ... 
               0 113 255; ... 
               0 85 255; ... 
               0 56 255; ... 
               0 28 255; ...
               0 0 255; ...
               32 0 255; ...
               64 0 255; ...
               96 0 255; ...
               128 0 255; ...
               160 0 255; ...
               192 0 255; ...
               224 0 255; ...
               255 0 255; ...
               255 32 255; ...
               255 64 255; ...
               255 96 255; ...
               255 128 255; ...
               255 160 255; ...
               255 192 255; ...
               255 224 255; ...
               255 255 255; ...
               255 224 224; ...
               255 192 192; ...
               255 160 160; ...
               255 128 128; ...
               255 96 96; ...
               255 64 64; ...
               255 32 32;];
               
    % Setup the axes
    xlim(target, [-32768, 32767]);
    xlabel(target,'X');
    ylim(target, [-32768, 32767]);
    ylabel(target,'Y');
    zlim(target, [-32768, 32767]);
    zlabel(target, 'Z');
    
    if view3D == 0
        view(target, 2);
    else
        view(target, 3);
    end
    
    % Black background
    set(target, 'color', [.2 .2 .2]);
    
    % Draw all the visible lines
    for i = 1:length(s) - 1
        % Blanked (or overridden)?
        if ~(s(i) & 64) || (showBlanked == 1)
            % Indexed or RGB color?
            [n m] = size(c);
            if m == 1
                color = colors(c(i)+1,:);
            else
                color = c(i,:);
            end 
            
            % Convert colors to 0 to 1.0
            color = cast(color, 'double');
            color = color ./ 255;
            
            % Draw the line
            sx = x(i:i+1);
            sy = y(i:i+1);
            sz = z(i:i+1);
            
            if (sx(1) == sx(2)) && (sy(1) == sy(2)) && (sz(1) == sz(2))
                if view3D == 0
                   plot(target, sx(1), sy(1), '.', 'MarkerSize', 10, 'color', color);
                else
                   plot3(target, sx(1), sy(1), sz(1), '.', 'MarkerSize', 10, 'color', color);
                end
            end
            
            line(target, sx, sy, sz, 'color', color, 'LineWidth', 1.5);

        end
    end 
end
