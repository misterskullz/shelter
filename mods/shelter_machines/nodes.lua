local mod = shelter_machines

minetest.register_node(mod.mod_str .. 'dirt', {
	description = 'Dirt',
	tiles ={'shelter_dirt.png'},
	groups = {crumbly = 3, oddly_breakable_by_hand=1, falling_node = 1},
	drop = mod.mod_str .. 'dirt',
	--sounds = default.node_sound_stone_defaults(),
})
