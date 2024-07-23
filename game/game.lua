local inspect = require 'libs.inspect'
local events = require 'game.enums.events'
local ecs = require 'core.ecs'
-- cts = component_types
local cts = require 'game.enums.c_types'


-- Systems
local keyboard_system = require 'game.systems.keyboard_system'
local mouse_system = require 'game.systems.mouse_system'


local world = ecs:new()

ecs:add_system(keyboard_system)
ecs:add_system(mouse_system)

ecs:add_entity({
    { type = cts.Position, data = { x = 0, y = 0, z = 0 } },
    { type = cts.Player,   data = true }
})

ecs:add_entity({
    -- { type = cts.Position, data = { x = 0, y = 0, z = 0 } },
    { type = cts.Velocity, data = 0.5 },
})

ecs:add_entity({
    -- { type = cts.Position, data = { x = 0, y = 0, z = 0 } },
    { type = cts.Velocity, data = 0.5 },
})

ecs:add_entity({
    { type = cts.Position, data = { x = 0, y = 0, z = 0 } },
    { type = cts.Velocity, data = 0.5 },
    { type = cts.Enemy,    data = 0.5 },
})

world:add_event(events.Keyboard)
world:add_event(events.Mouse)
world:add_event(events.Keyboard)
world:add_event(events.Keyboard)
world:add_event(events.Keyboard)
world:add_event(events.Keyboard)
world:add_event(events.Keyboard)
world:update(0.16)
