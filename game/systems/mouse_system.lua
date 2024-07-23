local inspect = require 'libs.inspect'
local c_type = require 'game.enums.c_types'
local events = require 'game.enums.events'

return {
    events = { events.Mouse },
    process = function(world, dt)
        print('mouse')
        local query = world:query({ c_type.Velocity })
        print('query_entities', inspect(query))
        local key = query[1] .. c_type.Velocity
        print(key)
        local velocity_data = world.components[key]
        print(velocity_data)
    end
}
