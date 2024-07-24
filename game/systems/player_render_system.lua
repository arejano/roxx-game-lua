local inspect = require 'libs.inspect'
local c_type = require 'game.enums.c_types'
local events = require 'game.enums.events'

return {
    events = { events.Render },
    process = function(world, dt)
        world.counter.player_render = world.counter.player_render + 1
        love.graphics.print("teste", 50, 50)
        local player = world:query({ c_type.Player })[1]

        local sprite = world:get_component(player, c_type.Sprite).data
        local position = world:get_component(player, c_type.Position).data
        local animation = world:get_component(player, c_type.Animation).data
        love.graphics.print(inspect(animation), 200, 200)

        animation.current_animation:draw(sprite, position.x, position.y, nil, 6, nil, 6, 9)
    end
}
