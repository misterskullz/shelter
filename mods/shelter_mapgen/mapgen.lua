local mod = shelter_mapgen
local mod.mod_str = 'xshelter_mapgen:'
--[[

Notes:
- It looks like the biome node top doesn't work unless there is a water node registered

]]--
minetest.register_alias('mapgen_stone', mod.mod_str .. 'stone')
minetest.register_alias('mapgen_dirt', mod.mod_str .. 'sand')
minetest.register_alias('mapgen_dirt_with_grass', mod.mod_str .. 'sand')
minetest.register_alias('mapgen_sand', mod.mod_str .. 'sand')
minetest.register_alias('mapgen_water_source', mod.mod_str .. 'water_source_toxic')
minetest.register_alias('mapgen_river_water_source', mod.mod_str .. 'water_source_toxic')
minetest.register_alias('mapgen_lava_source', mod.mod_str .. 'water_source_toxic')
minetest.register_alias('mapgen_gravel', mod.mod_str .. 'stone')

minetest.register_alias('mapgen_tree', mod.mod_str .. 'stone')
minetest.register_alias('mapgen_leaves', mod.mod_str .. 'stone')
minetest.register_alias('mapgen_apple', mod.mod_str .. 'stone')
minetest.register_alias('mapgen_junglegrass', mod.mod_str .. 'stone')

minetest.register_alias('mapgen_cobble', mod.mod_str .. 'stone')
minetest.register_alias('mapgen_stair_cobble', mod.mod_str .. 'stone')
minetest.register_alias('mapgen_mossycobble', mod.mod_str .. 'stone')

minetest.clear_registered_biomes()
minetest.clear_registered_ores()
minetest.clear_registered_decorations()

local color_strings = mod.color_strings
local n = #color_strings
local clust_size = n * n * n
for i,_ in ipairs(color_strings) do
	minetest.register_ore({
		ore_type       = 'scatter',
		ore            = mod.mod_str .. 'sand' .. tostring(i),
		wherein        = mod.mod_str .. 'sand',
		clust_scarcity = clust_size,
		clust_num_ores = 16,
		clust_size     = n,
	})

	minetest.register_ore({
		ore_type       = 'scatter',
		ore            = mod.mod_str .. 'stone' .. tostring(i),
		wherein        = mod.mod_str .. 'stone',
		clust_scarcity = clust_size,
		clust_num_ores = 16,
		clust_size     = n,
	})
end

minetest.register_biome({
	name = 'desert',
	--node_dust = '',
	node_top = mod.mod_str .. 'sand',
	depth_top = 8,
	node_filler = mod.mod_str .. 'stone',
	depth_filler = 1,
	node_stone = mod.mod_str .. 'stone',
})



