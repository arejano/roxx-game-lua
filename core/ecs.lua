local inspect = require 'libs.inspect'
local utils = require 'core.utils'

ecs = {
    game_modes = {},
    game_events = {},

    entities = {},
    -- lista de entidades que cada component_type possui
    entity_by_c_type = {},
    components = {},

    systems = {},
    systems_by_event = {},

    pool_event = {},

    -- query
    query_data = nil,
    query_types = nil,
    delta_time = nil,
}
ecs.__index = ecs

function ecs:new()
    local self = setmetatable({}, ecs)
    return self
end

function ecs:query(ctypes)
    self.query_types = ctypes
    local entities = {}

    for k, v in pairs(ctypes) do
        if self.entity_by_c_type[v] then
            for _, entity_id in ipairs(self.entity_by_c_type[v]) do
                if not entities[entity_id] then
                    table.insert(entities, entity_id)
                end
            end
        end
    end
    self.query_data = entities
    return self.query_data
end

function ecs:each(fn)
    if fn == nil then return end
    fn(self.query_data)
end

function ecs:add_entity(components)
    local new_entity = #self.entities + 1

    for _, component in pairs(components) do
        self:register_component(new_entity, component)
    end
end

function ecs:register_component(entity, component)
    -- Escape
    local invalid_keys = utils.check_keys({ "type", "data" }, component)
    if #invalid_keys > 0 then return nil end

    local new_component_id = #self.components + 1

    -- Cria a tabela caso nao exista
    if self.entity_by_c_type[component.type] == nil then
        self.entity_by_c_type[component.type] = {}
    end
    table.insert(self.entity_by_c_type[component.type], entity)

    -- Update Componentes
    local key = entity .. component.type
    self.components[key] = component.data

    -- Update Entitites -> List<CType>
    if self.entities[entity] == nil then
        self.entities[entity] = {}
    end
    table.insert(self.entities[entity], component.type)
end

function ecs:add_event(event)
    table.insert(self.pool_event, event)
end

function ecs:get_component(entity, c_type)
    return self.components[entity .. c_type]
end

function ecs:set_component(entity, c_type, data)
    self.components[entity .. c_type] = data
end

function ecs:add_system(system)
    local new_id = #self.systems + 1;
    self.systems[new_id] = system.process

    for _, event in pairs(system.events) do
        if self.systems_by_event[event] == nil then
            self.systems_by_event[event] = {}
        end
        table.insert(self.systems_by_event[event], new_id)
    end
end

function ecs:update(dt)
    while #self.pool_event > 0 do
        local event = table.remove(self.pool_event, 1)
        local to_run = self.systems_by_event[event]
        if to_run ~= nil then
            for i, s in pairs(to_run) do
                self.systems[s](self, dt)
            end
        end
    end
end

return ecs
