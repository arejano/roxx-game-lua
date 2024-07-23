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
    "Renderable",
    "Invisible"
})

return c_types
