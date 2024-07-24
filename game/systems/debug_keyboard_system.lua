local c_type = require 'game.enums.c_types'
local events = require 'game.enums.events'

return {
    events = { events.Keyboard },
    process = function(world, dt, event)
        local entity = world:query({ c_type.Debug_Keyboard })[1]
        local data = world:get_component(entity, c_type.Debug_Keyboard)
        table.insert(data, "KKK")
        world:set_component(entity, c_type.Debug_Keyboard, data)


        for i, k in pairs(data) do
            love.graphics.print(k, 20, 20)
        end
    end
}
