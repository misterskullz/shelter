local mod = shelter_machines

local full_node_box = {
    type = 'fixed',
    fixed = {-0.5, -0.5, -0.5, 0.5, 0.5, 0.5}
}

minetest.register_node(mod.mod_str .. 'computer_relay', {
    description = 'Computer relay',
	tiles = {
		'shelter_computer_relay_top.png',
		'shelter_computer_relay_top.png',
		'shelter_computer_relay_side.png',
		'shelter_computer_relay_side.png',
		'shelter_computer_relay_side.png',
		'shelter_computer_relay_side.png'
	},
	drawtype = 'nodebox',
	paramtype = 'light',
	node_box = {
		type = 'fixed',
		fixed = {
			{-0.4375, -0.5, -0.4375, 0.4375, -0.3125, 0.4375},
			{-0.4375, 0.3125, -0.4375, 0.4375, 0.5, 0.4375},
			{-0.3125, -0.375, -0.3125, 0.3125, 0.375, 0.3125},
			{-0.25, -0.1875, -0.5, 0.25, 0.1875, 0.5},
			{-0.5, -0.1875, -0.25, 0.5, 0.1875, 0.25},
		}
    },
    is_ground_content = true,
    sunlight_propagates = true,
    light_source = 6,
    collision_box = full_node_box,
})

minetest.register_abm({
    label = mod.mod_str .. 'computer_relay_zaps',
    nodenames = {mod.mod_str .. 'computer_relay'},
    interval = 10,
    chance = 5,
    action = function(pos)
        local neighbors = {
            {
                check = {x = pos.x + 2, y = pos.y, z = pos.z},
                spawn = {x = pos.x + 1, y = pos.y, z = pos.z}
            },
            {
                check = {x = pos.x, y = pos.y, z = pos.z + 2},
                spawn = {x = pos.x, y = pos.y, z = pos.z + 1}
            },
            {
                check = {x = pos.x - 2, y = pos.y, z = pos.z},
                spawn = {x = pos.x - 1, y = pos.y, z = pos.z}
            },
            {
                check = {x = pos.x, y = pos.y, z = pos.z - 2},
                spawn = {x = pos.x, y = pos.y, z = pos.z - 1}
            },
        }

        for _, neighbor in pairs(neighbors) do
            local node = minetest.get_node(neighbor.check)

            if node.name == mod.mod_str .. 'computer_relay' then
                minetest.add_particlespawner({
                    amount = math.random(1, 3),
                    time = math.random(1, 3),
                    glow = 14,
                    minpos = neighbor.spawn,
                    maxpos = neighbor.spawn,
                    minexptime = 0.1,
                    maxexptime = 0.5,
                    minsize = 5,
                    maxsize = 10,
                    minacc = {x = 0, y = 0.5, z = 0},
                    maxacc = {x = 0, y = 6, z = 0},
                    texture = 'shelter_computer_relay_particle.png'
                })

                minetest.sound_play({name = 'shelter_computer_relay_beep'}, {pos = neighbor.spawn, gain = 0.5})
            end
        end
    end,
})

minetest.register_node(mod.mod_str .. 'dirt', {
	description = 'Dirt',
	tiles ={'shelter_dirt.png'},
	groups = {crumbly = 3, oddly_breakable_by_hand=1, falling_node = 1},
	drop = mod.mod_str .. 'dirt',
	--sounds = default.node_sound_stone_defaults(),
})
