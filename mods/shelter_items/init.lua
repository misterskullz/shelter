shelter_items = {}
local mod = shelter_items
mod.mod_str = 'shelter_items:'

local path = minetest.get_modpath("shelter_items") .. '/'

dofile(path .. 'basic_items.lua')
dofile(path .. 'energy.lua')