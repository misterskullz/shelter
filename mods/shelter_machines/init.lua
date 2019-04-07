shelter_machines = {}
local mod = shelter_machines
mod.mod_str = 'shelter_machines:'
local helper = shelter_helpers

local path = minetest.get_modpath('shelter_machines') .. '/'
local toxic_air = 'shelter_mapgen:air_toxic'
local pure_air = 'shelter_mapgen:air'

dofile(path .. 'nodes.lua')

function mod.purify_air(pos, distance)
    helper.replace_nodes_around_position(pos, distance, toxic_air, pure_air)
end