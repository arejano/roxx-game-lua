local utils = require 'core.utils'

local events = utils.make_enum({
    "Keyboard",
    "Mouse",
})

return events
