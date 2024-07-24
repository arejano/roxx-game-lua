local lick = require 'lick'
lick.reset = true

local inspect = require 'libs.inspect'

local game = require 'game.game'
local events = require 'game.enums.events'
local config = require 'confi'
local debug_ui = require 'game.ui.debug_components'
local render_system = require 'game.systems.render_system'
local cts = require 'game.enums.c_types'

function love.load()
    world = game
end

function love.update(dt)
    world:update(dt)
end

function love.mousepressed(x, y, button, istouch)
end

function love.mousereleased(x, y, button, istouch)
end

function love.keypressed(key, scancode, isrepeat)
    world:add_event(events.Keyboard)
    local player = world:query({ cts.Player })[1]
    local animation_data = world:get_component(player, cts.Animation).data
    local position_data = world:get_component(player, cts.Position).data
    local speed_data = world:get_component(player, cts.Speed).data

    if key == "a" then
        animation_data.current_animation = animation_data.animations.left
        position_data.x = position_data.x - 1 * speed_data
    end

    if key == "w" then
        animation_data.current_animation = animation_data.animations.up
        position_data.y = position_data.y - 1 * speed_data
    end

    if key == "s" then
        animation_data.current_animation = animation_data.animations.down
        position_data.y = position_data.y + 1 * speed_data
    end

    if key == "d" then
        animation_data.current_animation = animation_data.animations.right
        position_data.x = position_data.x + 1 * speed_data
    end

    world:set_component(player, cts.Animation, animation_data)
    world:set_component(player, cts.Position, position_data)
end

function love.draw()
    -- render_system.render(world)
    love.graphics.print(world.counter.player_render, 100, 100)
    love.graphics.print(world.delta_time, 150, 150)
    world:add_event(events.Render)
    world:update()
end
