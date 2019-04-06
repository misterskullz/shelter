local mod = shelter_mapgen

--[[

Notes:
- It looks like the biome node top doesn't work unless there is a water node registered

]]--
minetest.register_alias('mapgen_stone', 'shelter_mapgen:stone')
minetest.register_alias('mapgen_dirt', 'shelter_mapgen:sand')
minetest.register_alias('mapgen_dirt_with_grass', 'shelter_mapgen:sand')
minetest.register_alias('mapgen_sand', 'shelter_mapgen:sand')
minetest.register_alias('mapgen_water_source', 'shelter_mapgen:water_source_toxic')
minetest.register_alias('mapgen_river_water_source', 'shelter_mapgen:water_source_toxic')
minetest.register_alias('mapgen_lava_source', 'shelter_mapgen:water_source_toxic')
minetest.register_alias('mapgen_gravel', 'shelter_mapgen:stone')

minetest.register_alias('mapgen_tree', 'shelter_mapgen:stone')
minetest.register_alias('mapgen_leaves', 'shelter_mapgen:stone')
minetest.register_alias('mapgen_apple', 'shelter_mapgen:stone')
minetest.register_alias('mapgen_junglegrass', 'shelter_mapgen:stone')

minetest.register_alias('mapgen_cobble', 'shelter_mapgen:stone')
minetest.register_alias('mapgen_stair_cobble', 'shelter_mapgen:stone')
minetest.register_alias('mapgen_mossycobble', 'shelter_mapgen:stone')

minetest.clear_registered_biomes()
minetest.clear_registered_ores()
minetest.clear_registered_decorations()

local color_strings = mod.color_strings
local n = #color_strings
local clust_size = n * n * n
for i,_ in ipairs(color_strings) do
	minetest.register_ore({
		ore_type       = 'scatter',
		ore            = 'shelter_mapgen:sand' .. tostring(i),
		wherein        = 'shelter_mapgen:sand',
		clust_scarcity = clust_size,
		clust_num_ores = 16,
		clust_size     = n,
	})

	minetest.register_ore({
		ore_type       = 'scatter',
		ore            = 'shelter_mapgen:stone' .. tostring(i),
		wherein        = 'shelter_mapgen:stone',
		clust_scarcity = clust_size,
		clust_num_ores = 16,
		clust_size     = n,
	})
end

minetest.register_biome({
	name = 'desert',
	--node_dust = '',
	node_top = 'shelter_mapgen:sand',
	depth_top = 8,
	node_filler = 'shelter_mapgen:stone',
	depth_filler = 1,
	node_stone = 'shelter_mapgen:stone',
})



