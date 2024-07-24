local utils = require 'core.utils'

local c_types = utils.make_enum({
    "Player",
    "Enemy",
    "Velocity",
    "Position",
    "Tile",
    "Item",
    "Health",
    "Name",
    "Invisible",
    -- Render
    "Renderable",
    "Sprite",
    "Speed",
    "Grid",
    "Animation",
    -- Debug
    "Debug_Keyboard"
})

return c_types
