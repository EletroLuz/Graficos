on_render(function()
    local local_player = get_local_player()
    if not local_player then
        return
    end

    -- Get the player's position
    local player_position = local_player:get_position()
    
    -- Define colors
    local color_blue = color.new(0, 0, 255)
    local color_green = color.new(0, 255, 0)
    
    -- Define positions and radii for the circles
    local circles = {
        {position = vec3.new(310.5517578125, -658.2333984375, 4.80859375), radius = 500, color = color_blue}, -- IronWolfs
        {position = vec3.new(249.9111328125, -720.498046875, 6.2861328125), radius = 500, color = color_blue}, -- IronWolfs
        {position = vec3.new(372.75390625, -726.7060546875, 15.76171875), radius = 500, color = color_blue}, -- IronWolfs
        {position = vec3.new(348.564453125, -809.1455078125, 17.1708984375), radius = 500, color = color_blue}, -- IronWolfs
        {position = vec3.new(424.310546875, -647.0712890625, 5.63671875), radius = 500, color = color_blue}, -- IronWolfs
        {position = vec3.new(300.7998046875, -719.265625, 5.48046875), radius = 500, color = color_blue}, -- IronWolfs est
        {position = vec3.new(384.681640625, -771.30078125, 15.3662109375), radius = 500, color = color_blue}, -- IronWolfs est
        {position = vec3.new(462.435546875, -803.1123046875, 15.1083984375), radius = 500, color = color_blue}, -- IronWolfs est
        {position = vec3.new(547.05078125, -610.212890625, 6.0498046875), radius = 500, color = color_blue}, -- IronWolfs est
        {position = vec3.new(520.265625, -570.7470703125, 16.6982421875), radius = 500, color = color_blue}, -- IronWolfs est
        {position = vec3.new(554.947265625, -481.0537109375, 6.1884765625), radius = 500, color = color_blue}, -- IronWolfs est
        {position = vec3.new(537.494140625, -407.6806640625, 5.720703125), radius = 500, color = color_blue}, -- IronWolfs est
        {position = vec3.new(360.6845703125, -353.37109375, 5.5751953125), radius = 500, color = color_blue}, -- IronWolfs est
        {position = vec3.new(609.2822265625, -156.2587890625, 9.9228515625), radius = 500, color = color_blue}, -- IronWolfs est
        {position = vec3.new(589.9384765625, -202.4443359375, 10.7509765625), radius = 500, color = color_blue}, -- IronWolfs est
        {position = vec3.new(549.060546875, -430.2099609375, 8.091796875), radius = 500, color = color_green}, -- IronWolfs prox hell baixa
        {position = vec3.new(522.1171875, -311.8037109375, 9.7412109375), radius = 500, color = color_green}, -- IronWolfs prox hell baixa
        {position = vec3.new(600.087890625, -123.080078125, 12.369140625), radius = 500, color = color_green}, -- IronWolfs prox hell baixa 
        {position = vec3.new(375.7080078125, -329.982421875, 6.1005859375), radius = 500, color = color_green}, -- IronWolfs prox hell baixa
        {position = vec3.new(561.3359375, -558.3310546875, 6.248046875), radius = 500, color = color_green}, -- IronWolfs prox hell baixa
        {position = vec3.new(326.544921875, -717.23828125, 19.0830078125), radius = 500, color = color_green}, -- IronWolfs prox hell alta
        {position = vec3.new(263.859375, -783.404296875, 14.419921875), radius = 500, color = color_green}, -- IronWolfs prox hell alta
        {position = vec3.new(315.8515625, -576.26953125, 3.546875), radius = 500, color = color_green}, -- IronWolfs prox hell alta
        {position = vec3.new(271.38671875, -543.89453125, 3.09375), radius = 500, color = color_green}, -- IronWolfs prox hell alta
        {position = vec3.new(376.9990234375, -619.955078125, 11.51953125), radius = 500, color = color_green}, -- IronWolfs prox hell alta
        {position = vec3.new(431.9189453125, -742.04296875, 12.8369140625), radius = 500, color = color_green}, -- IronWolfs prox hell alta
        {position = vec3.new(523.8271484375, -725.49609375, 15.265625), radius = 500, color = color_green}, -- IronWolfs prox hell alta
        {position = vec3.new(392.59375, -813.8837890625, 0.3173828125), radius = 500, color = color_green}, -- IronWolfs prox hell alta
        {position = vec3.new(316.615234375, -559.7138671875, 5.236328125), radius = 500, color = color_green}, -- IronWolfs prox hell alta 2
        {position = vec3.new(648.943359375, -546.3271484375, 2.5986328125), radius = 500, color = color_green}, -- IronWolfs prox hell alta 2
        {position = vec3.new(446.62109375, -423.15625, 5.71875), radius = 500, color = color_green}, -- IronWolfs prox hell alta 2
        {position = vec3.new(416.17578125, -267.8740234375, 9.462890625), radius = 500, color = color_green}, -- IronWolfs prox hell alta 2
        {position = vec3.new(555.9169921875, -386.9453125, 5.69140625), radius = 500, color = color_green}, -- IronWolfs prox hell alta 2
        {position = vec3.new(522.28125, -166.783203125, 5.3427734375), radius = 500, color = color_green}, -- IronWolfs prox hell alta 2
    }

    -- Define the thickness of the line
    local thickness = 3.0
    
    -- Function to find the closest circle to the player
    local function find_closest_circle(player_pos, circles_list)
        local closest_circle = nil
        local closest_distance = math.huge
        for _, circle in ipairs(circles_list) do
            local dist = player_pos:squared_dist_to(circle.position)
            if dist < closest_distance then
                closest_distance = dist
                closest_circle = circle
            end
        end
        return closest_circle
    end

    -- Find the closest circle to the player
    local closest_circle = find_closest_circle(player_position, circles)

    -- Draw the circles and set pins
    for _, circle in ipairs(circles) do
        if graphics.circle_2d then
            graphics.circle_2d(circle.position, circle.radius, circle.color)
        end
    end
    
    -- Draw the line from the player's position to each circle's position
    if graphics.line then
        for _, circle in ipairs(circles) do
            graphics.line(player_position, circle.position, circle.color, thickness)
        end
    end

    -- Set a pin only on the closest circle
    if utility.set_map_pin and closest_circle then
        local success = utility.set_map_pin(closest_circle.position)
        if not success then
            -- Handle pin placement failure if needed
        end
    end

    -- Update the pin if the player reaches the closest circle
    if closest_circle and player_position:dist_to(closest_circle.position) < closest_circle.radius then
        -- Find the next closest circle
        local next_closest_circle = find_closest_circle(player_position, circles)
        if next_closest_circle ~= closest_circle then
            -- Set a pin on the next closest circle
            if utility.set_map_pin and next_closest_circle then
                local success = utility.set_map_pin(next_closest_circle.position)
                if not success then
                    -- Handle pin placement failure if needed
                end
            end
        end
    end
end)
