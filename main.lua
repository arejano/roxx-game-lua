local ecs = require 'core.ecs'
function love.load()
    world = ecs:new()

    text = "no_text"
    bombs = {}
    mousepressed = false
end

function love.update(dt)
    world:update(dt)
    text = world.delta_time
    if mousepressed then
        new_bomb(love.mouse.getX(), love.mouse.getY())
    end
end

function love.mousepressed(x, y, button, istouch)
    mousepressed = true
end

function new_bomb(x, y)
    table.insert(bombs, { x = x, y = y })
end

function love.mousereleased(x, y, button, istouch)
    mousepressed = false
end

function love.draw()
    for i, k in pairs(bombs) do
        love.graphics.rectangle("fill", k.x, k.y, 1, 1)
    end
    love.graphics.print(text, 400, 300)
end
