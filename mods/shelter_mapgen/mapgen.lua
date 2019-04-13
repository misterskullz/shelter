local mod = shelter_mapgen

--[[

Notes:
- It looks like the biome node top doesn't work unless there is a water node registered

]]--

local stone = mod.mod_str .. 'stone1'
local sand = mod.mod_str .. 'sand5'
minetest.register_alias('mapgen_stone', stone)
minetest.register_alias('mapgen_dirt', sand)
minetest.register_alias('mapgen_dirt_with_grass', sand)
minetest.register_alias('mapgen_sand', sand)
minetest.register_alias('mapgen_water_source', mod.mod_str .. 'water_source_toxic')
minetest.register_alias('mapgen_river_water_source', mod.mod_str .. 'water_source_toxic')
minetest.register_alias('mapgen_lava_source', mod.mod_str .. 'water_source_toxic')
minetest.register_alias('mapgen_gravel', stone)

minetest.register_alias('mapgen_tree', stone)
minetest.register_alias('mapgen_leaves', stone)
minetest.register_alias('mapgen_apple', stone)
minetest.register_alias('mapgen_junglegrass', stone)

minetest.register_alias('mapgen_cobble', stone)
minetest.register_alias('mapgen_stair_cobble', stone)
minetest.register_alias('mapgen_mossycobble', stone)

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
		wherein        = sand,
		clust_scarcity = clust_size,
		clust_num_ores = 16,
		clust_size     = n,
	})

	minetest.register_ore({
		ore_type       = 'scatter',
		ore            = mod.mod_str .. 'stone' .. tostring(i),
		wherein        = stone,
		clust_scarcity = clust_size,
		clust_num_ores = 16,
		clust_size     = n,
	})
end

minetest.register_biome({
	name = 'desert',
	--node_dust = '',
	node_top = sand,
	depth_top = 8,
	node_filler = stone,
	depth_filler = 1,
	node_stone = stone,
})



