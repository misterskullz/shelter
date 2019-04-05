local mod = shelter_mapgen

minetest.register_node('shelter:air_toxic', {
	description = 'Toxic air',
	drawtype = 'airlike',
	groups = {cracky=3},
	drop = 'default:cobble',
	sounds = default.node_sound_stone_defaults(),
})


minetest.register_node("shelter:air_toxic", {
	description = "Toxic air",
	drawtype = "airlike",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	floodable = true,
	air_equivalent = true,
	drop = "",
	drowning = 1,
	post_effect_color = {a = 64, r = 200, g = 180, b = 80},
	groups = {not_in_creative_inventory = 1, toxic = 1},
})

minetest.register_node('default:stone_with_coal', {
	description = 'Stone with coal',
	tiles ={'default_stone.png^default_mineral_coal.png'},
	groups = {cracky=3},
	drop = 'default:coal_lump',
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node('default:stone_with_iron', {
	description = 'Stone with iron',
	tiles ={'default_stone.png^default_mineral_iron.png'},
	groups = {cracky=3},
	drop = 'default:iron_lump',
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node('default:dirt_with_grass', {
	description = 'Dirt with grass',
	tiles ={'default_grass.png', 'default_dirt.png',
		{name = 'default_dirt.png^default_grass_side.png',
		tileable_vertical = false}},
	groups = {crumbly=3, soil=1},
	drop = 'default:dirt',
	sounds = default.node_sound_dirt_defaults({
		footstep = {name='default_grass_footstep', gain=0.4},
	}),
})

minetest.register_node('default:dirt_with_grass_footsteps', {
	description = 'Dirt with grass and footsteps',
	tiles ={'default_grass_footsteps.png', 'default_dirt.png',
		{name = 'default_dirt.png^default_grass_side.png',
		tileable_vertical = false}},
	groups = {crumbly=3, soil=1},
	drop = 'default:dirt',
	sounds = default.node_sound_dirt_defaults({
		footstep = {name='default_grass_footstep', gain=0.4},
	}),
})

minetest.register_node('default:dirt', {
	description = 'Dirt',
	tiles ={'default_dirt.png'},
	groups = {crumbly=3, soil=1},
	sounds = default.node_sound_dirt_defaults(),
})

minetest.register_node('default:sand', {
	description = 'Sand',
	tiles ={'default_sand.png'},
	groups = {crumbly=3, falling_node=1},
	sounds = default.node_sound_sand_defaults(),
})

minetest.register_node('default:gravel', {
	description = 'Gravel',
	tiles ={'default_gravel.png'},
	groups = {crumbly=2, falling_node=1},
	sounds = default.node_sound_dirt_defaults({
		footstep = {name='default_gravel_footstep', gain=0.45},
	}),
})

minetest.register_node('default:sandstone', {
	description = 'Sandstone',
	tiles ={'default_sandstone.png'},
	groups = {crumbly=2,cracky=2},
	drop = 'default:sand',
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node('default:clay', {
	description = 'Clay',
	tiles ={'default_clay.png'},
	groups = {crumbly=3},
	drop = 'default:clay_lump 4',
	sounds = default.node_sound_dirt_defaults({
		footstep = '',
	}),
})

minetest.register_node('default:brick', {
	description = 'Brick',
	tiles ={'default_brick.png'},
	is_ground_content = false,
	groups = {cracky=3},
	drop = 'default:clay_brick 4',
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node('default:tree', {
	description = 'Tree',
	tiles ={'default_tree_top.png', 'default_tree_top.png', 'default_tree.png'},
	is_ground_content = false,
	groups = {snappy=2,choppy=2,oddly_breakable_by_hand=1},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_node('default:junglegrass', {
	description = 'Jungle Grass',
	drawtype = 'plantlike',
	visual_scale = 1.3,
	tiles ={'default_junglegrass.png'},
	inventory_image = 'default_junglegrass.png',
	wield_image = 'default_junglegrass.png',
	paramtype = 'light',
	walkable = false,
	groups = {snappy=3,attached_node=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node('default:leaves', {
	description = 'Leaves',
	drawtype = 'allfaces_optional',
	visual_scale = 1.3,
	tiles ={'default_leaves.png'},
	paramtype = 'light',
	is_ground_content = false,
	groups = {snappy=3},
	drop = {
		max_items = 1,
		items = {
			{
				-- player will get sapling with 1/20 chance
				items = {'default:sapling'},
				rarity = 20,
			},
			{
				-- player will get leaves only if he get no saplings,
				-- this is because max_items is 1
				items = {'default:leaves'},
			}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node('default:cactus', {
	description = 'Cactus',
	tiles ={'default_cactus_top.png', 'default_cactus_top.png', 'default_cactus_side.png'},
	groups = {snappy=2,choppy=3},
	sounds = default.node_sound_wood_defaults(),
})


minetest.register_node('default:water_flowing', {
	description = 'Water (flowing)',
	drawtype = 'flowingliquid',
	tiles = {'default_water.png'},
	special_tiles = {
		{name = 'default_water.png', backface_culling = false},
		{name = 'default_water.png', backface_culling = true},
	},
	alpha = WATER_ALPHA,
	paramtype = 'light',
	paramtype2 = 'flowingliquid',
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = '',
	drowning = 1,
	liquidtype = 'flowing',
	liquid_alternative_flowing = 'default:water_flowing',
	liquid_alternative_source = 'default:water_source',
	liquid_viscosity = WATER_VISC,
	post_effect_color = {a = 64, r = 100, g = 100, b = 200},
	groups = {water = 3, liquid = 3},
})

minetest.register_node('default:water_source', {
	description = 'Water',
	drawtype = 'liquid',
	tiles = {'default_water.png'},
	special_tiles = {
		-- New-style water source material (mostly unused)
		{name = 'default_water.png', backface_culling = false},
	},
	alpha = WATER_ALPHA,
	paramtype = 'light',
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = '',
	drowning = 1,
	liquidtype = 'source',
	liquid_alternative_flowing = 'default:water_flowing',
	liquid_alternative_source = 'default:water_source',
	liquid_viscosity = WATER_VISC,
	drowning = 1,
	post_effect_color = {a = 64, r = 100, g = 100, b = 200},
	groups = {water = 3, liquid = 3},
})

minetest.register_node('default:river_water_source', {
	description = 'River Water Source',
	drawtype = 'liquid',
	tiles = {'default_river_water.png'},
	special_tiles = {
		-- New-style water source material (mostly unused)
		{name = 'default_river_water.png', backface_culling = false},
	},
	alpha = 160,
	paramtype = 'light',
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = '',
	drowning = 1,
	liquidtype = 'source',
	liquid_alternative_flowing = 'default:river_water_flowing',
	liquid_alternative_source = 'default:river_water_source',
	liquid_viscosity = 1,
	liquid_renewable = false,
	liquid_range = 2,
	post_effect_color = {a = 103, r = 30, g = 76, b = 90},
	groups = {water = 3, liquid = 3, puts_out_fire = 1, cools_lava = 1},
})

minetest.register_node('default:river_water_flowing', {
	description = 'Flowing River Water',
	drawtype = 'flowingliquid',
	tiles = {'default_river_water.png'},
	special_tiles = {
		{name = 'default_river_water.png', backface_culling = false},
		{name = 'default_river_water.png', backface_culling = true},
	},
	alpha = 160,
	paramtype = 'light',
	paramtype2 = 'flowingliquid',
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = '',
	drowning = 1,
	liquidtype = 'flowing',
	liquid_alternative_flowing = 'default:river_water_flowing',
	liquid_alternative_source = 'default:river_water_source',
	liquid_viscosity = 1,
	liquid_renewable = false,
	liquid_range = 2,
	post_effect_color = {a = 103, r = 30, g = 76, b = 90},
	groups = {water = 3, liquid = 3, puts_out_fire = 1,
		not_in_creative_inventory = 1, cools_lava = 1},
})

minetest.register_node('default:lava_flowing', {
	description = 'Lava (flowing)',
	inventory_image = minetest.inventorycube('default_lava.png'),
	drawtype = 'flowingliquid',
	tiles ={'default_lava.png'},
	special_tiles = {
		{
			image='default_lava_flowing_animated.png',
			backface_culling=false,
			animation={type='vertical_frames', aspect_w=16, aspect_h=16, length=3.3}
		},
		{
			image='default_lava_flowing_animated.png',
			backface_culling=true,
			animation={type='vertical_frames', aspect_w=16, aspect_h=16, length=3.3}
		},
	},
	paramtype = 'light',
	light_source = LIGHT_MAX - 1,
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drowning = 1,
	liquidtype = 'flowing',
	liquid_alternative_flowing = 'default:lava_flowing',
	liquid_alternative_source = 'default:lava_source',
	liquid_viscosity = LAVA_VISC,
	damage_per_second = 4*2,
	post_effect_color = {a=192, r=255, g=64, b=0},
	groups = {lava=3, liquid=2, hot=3},
})

minetest.register_node('default:lava_source', {
	description = 'Lava',
	inventory_image = minetest.inventorycube('default_lava.png'),
	drawtype = 'liquid',
	--tiles ={'default_lava.png'},
	tiles = {
		{
			name = 'default_lava_source_animated.png',
			animation = {type='sheet_2d', frames_w=3, frames_h=2, frame_length=0.5}
		}
	},
	special_tiles = {
		-- New-style lava source material (mostly unused)
		{name='default_lava.png', backface_culling=false},
	},
	paramtype = 'light',
	light_source = LIGHT_MAX - 1,
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drowning = 1,
	liquidtype = 'source',
	liquid_alternative_flowing = 'default:lava_flowing',
	liquid_alternative_source = 'default:lava_source',
	liquid_viscosity = LAVA_VISC,
	damage_per_second = 4*2,
	post_effect_color = {a=192, r=255, g=64, b=0},
	groups = {lava=3, liquid=2, hot=3},
})

minetest.register_node('default:cobble', {
	description = 'Cobble',
	tiles ={'default_cobble.png'},
	is_ground_content = false,
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node('default:mossycobble', {
	description = 'Mossy Cobble',
	tiles ={'default_mossycobble.png'},
	is_ground_content = false,
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
})