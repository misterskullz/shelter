local mod = shelter_mapgen
local helper = shelter_helpers
local items_str = 'shelter_items:'

minetest.register_node(mod.mod_str .. 'air', {
	description = 'Air',
	drawtype = 'airlike',
	paramtype = 'light',
	sunlight_propagates = true,
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	floodable = true,
	air_equivalent = true,
	drop = '',
	groups = {not_in_creative_inventory = 1},
})

minetest.register_node(mod.mod_str .. 'spawn_air', {
	description = 'Spawn air',
	drawtype = 'airlike',
	paramtype = 'light',
	sunlight_propagates = true,
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	floodable = true,
	air_equivalent = true,
	drop = '',
	groups = {not_in_creative_inventory = 1},
})


minetest.register_abm({
    label = mod.mod_str .. 'air_toxic_replace_air',
	nodenames = {'air'},
	neighbors = {mod.mod_str .. 'air'},
    interval = 0.5,
    chance = 100,
	action = function(pos)
		local air_nodes = helper.get_nodes_around_position(pos, 1, mod.mod_str .. 'air')
		if air_nodes[1] then
			local r = math.random(1, #air_nodes)
			local p = air_nodes[r]
			minetest.add_node(p, {name = 'air'})
			
			minetest.add_particlespawner({
				amount = math.random(1, 2),
				time = 0.5,
				minpos = {x = p.x - 1, y = p.y - 1, z = p.z - 1},
				maxpos = {x = p.x + 1, y = p.y + 1, z = p.z + 1},
				minexptime = 0.8,
				maxexptime = 1,
				minsize = 3,
				maxsize = 6,
				minacc = {x = 0, y = 0.5, z = 0},
            	maxacc = {x = 0.5, y = 1, z = 0.5},
				texture = 'shelter_air_toxic_particle.png',
				animation = {
					type = 'sheet_2d',
					frames_w = 3,
					frames_h = 3,
					frame_length = 0.1,
				},
			})
		end
    end,
})


minetest.override_item('air', {
	drowning = 1,
	post_effect_color = {a = 191, r = 255, g = 64, b = 0}, -- bug: post_effect_color on built in air doesn't work
	groups = {not_in_creative_inventory = 1, toxic = 1},
})




minetest.register_node(mod.mod_str .. 'water_source_toxic', {
	description = 'Toxic water source',
	drawtype = 'liquid',
	tiles = {
		{
			name = 'default_water_source_animated.png',
			backface_culling = false,
			animation = {
				type = 'vertical_frames',
				aspect_w = 16,
				aspect_h = 16,
				length = 2.0,
			},
		},
		{
			name = 'default_water_source_animated.png',
			backface_culling = true,
			animation = {
				type = 'vertical_frames',
				aspect_w = 16,
				aspect_h = 16,
				length = 2.0,
			},
		},
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
	liquid_alternative_flowing = mod.mod_str .. 'water_flowing_toxic',
	liquid_alternative_source = mod.mod_str .. 'water_source_toxic',
	liquid_viscosity = 3,
	liquid_range = 3,
	light_source = 4,
	damage_per_second = 1,
	post_effect_color = {a = 103, r = 30, g = 60, b = 90},
	groups = {water = 3, liquid = 3, cools_lava = 1},
	--sounds = default.node_sound_water_defaults(),
})

minetest.register_node(mod.mod_str .. 'water_flowing_toxic', {
	description = 'Toxic flowing Water',
	drawtype = 'flowingliquid',
	tiles = {'default_water.png'},
	special_tiles = {
		{
			name = 'default_water_flowing_animated.png',
			backface_culling = false,
			animation = {
				type = 'vertical_frames',
				aspect_w = 16,
				aspect_h = 16,
				length = 0.8,
			},
		},
		{
			name = 'default_water_flowing_animated.png',
			backface_culling = true,
			animation = {
				type = 'vertical_frames',
				aspect_w = 16,
				aspect_h = 16,
				length = 0.8,
			},
		},
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
	liquid_alternative_flowing = mod.mod_str .. 'water_flowing_toxic',
	liquid_alternative_source = mod.mod_str .. 'water_source_toxic',
	liquid_viscosity = 3,
	liquid_range = 3,
	light_source = 3,
	damage_per_second = 1,
	post_effect_color = {a = 103, r = 30, g = 60, b = 90},
	groups = {water = 3, liquid = 3, not_in_creative_inventory = 1,
		cools_lava = 1},
	--sounds = default.node_sound_water_defaults(),
})

mod.color_strings = {
	'#9a6642', -- earth tone
	'#7b5235', -- darker earth tone
	'#b9815b', -- lighter earth tone
	'#91684b', -- desaturated earth tone
	'#d6d0b9', -- sand
	'#b9ae87', -- darker sand
	'#fbfaf8', -- lighter sand
	'#743331', -- red
	'#5d2927', -- darker red
	'#91403d', -- lighter red
}

function mod.colorize_tile(tile, color)
	return tile .. '^[multiply:' .. color
end

function mod.make_ground_nodes(name)
	local nodes = {}

	for i,color in ipairs(mod.color_strings) do 
		nodes[#nodes + 1] = {name .. tostring(i), color}
	end

	return nodes
end

minetest.register_node(mod.mod_str .. 'dirt', {
	description = 'Dirt',
	tiles ={'shelter_dirt.png'},
	groups = {crumbly = 3, oddly_breakable_by_hand=1, falling_node = 1},
	drop = mod.mod_str .. 'dirt',
	--sounds = default.node_sound_stone_defaults(),
})

minetest.register_node(mod.mod_str .. 'grass', {
	description = 'Grass',
	tiles = {'shelter_grass.png'},
	groups = {crumbly = 3, oddly_breakable_by_hand=1, falling_node = 1},
	drop = mod.mod_str .. 'grass',
	--sounds = default.node_sound_stone_defaults(),
})

minetest.register_node(mod.mod_str .. 'stone', {
	description = 'Stone',
	tiles = { 'shelter_stone.png' },
	color =mod.color_strings[1],
	groups = {cracky = 3, oddly_breakable_by_hand=1},
	drop = mod.mod_str .. 'stone',
	--sounds = default.node_sound_stone_defaults(),
})

for _,node in pairs(mod.make_ground_nodes(mod.mod_str .. 'stone')) do
	minetest.register_node(node[1], {
		description = 'Stone',
		tiles = { 'shelter_stone.png' },
		color = node[2],
		groups = {cracky = 3, not_in_creative_inventory = 1, oddly_breakable_by_hand=1},
		drop = mod.mod_str .. 'stone',
		--sounds = default.node_sound_stone_defaults(),
	})
end

minetest.register_node(mod.mod_str .. 'sand', {
	description = 'Sand',
	tiles = { 'shelter_sand.png' },
	color = mod.color_strings[5],
	groups = {crumbly = 3, oddly_breakable_by_hand=1, falling_node = 1},
	drop = mod.mod_str .. 'sand',
	--sounds = default.node_sound_stone_defaults(),
})

for _,node in pairs(mod.make_ground_nodes(mod.mod_str .. 'sand')) do
	minetest.register_node(node[1], {
		description = 'Sand',
		tiles = { 'shelter_sand.png' },
		color = node[2],
		groups = {crumbly = 3, not_in_creative_inventory = 1, oddly_breakable_by_hand=1, falling_node = 1},
		drop = {
			items = {
				{items = {mod.mod_str .. 'sand'}, rarity = 1, inherit_color = true},
				{items = {items_str .. 'material_scrap'}, rarity = 3}
			},
		},
		--sounds = default.node_sound_stone_defaults(),
	})
end