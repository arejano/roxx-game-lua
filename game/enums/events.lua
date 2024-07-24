local utils = require 'core.utils'

local events = utils.make_enum({
    "Render",
    "Keyboard",
    "Mouse",
})

return events
