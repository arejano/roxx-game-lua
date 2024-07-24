local inspect = require 'libs.inspect'
local events = require 'game.enums.events'
local ecs = require 'core.ecs'
-- cts = component_types
local cts = require 'game.enums.c_types'
local debug_keyboard_system = require 'game.systems.debug_keyboard_system'
local anim8 = require 'libs.anim8.anim8'
local player_render_system = require 'game.systems.player_render_system'

-- Systems
local keyboard_system = require 'game.systems.keyboard_system'
local mouse_system = require 'game.systems.mouse_system'

-- World Init
local world = ecs:new()



-- ecs:add_system(keyboard_system)
-- ecs:add_system(mouse_system)
ecs:add_system(debug_keyboard_system)
ecs:add_system(player_render_system)

-- Player
local player_sprite = love.graphics.newImage('game/sprites/player-sheet.png')
local player_grid = anim8.newGrid(12, 18, player_sprite:getWidth(), player_sprite:getHeight())
local player_animations = {
    down = anim8.newAnimation(player_grid('1-4', 1), 0.2),
    left = anim8.newAnimation(player_grid('1-4', 2), 0.2),
    right = anim8.newAnimation(player_grid('1-4', 3), 0.2),
    up = anim8.newAnimation(player_grid('1-4', 4), 0.2),
}
ecs:add_entity({
    { type = cts.Player,   data = true },
    { type = cts.Position, data = { x = 100, y = 100 } },
    { type = cts.Speed,    data = 5 },
    { type = cts.Sprite,   data = player_sprite },
    { type = cts.Grid,     data = player_grid },
    {
        type = cts.Animation,
        data = {
            current_animation = player_animations.left,
            animations = player_animations
        }
    }
})

-- -- Debug ??
-- ecs:add_entity({
--     { type = cts.Debug_Keyboard, data = { "kkk" } },
-- })

-- world:add_event(events.Keyboard)
-- world:update(0.16)

return world
