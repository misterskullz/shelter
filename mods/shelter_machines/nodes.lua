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
    is_ground_content = false,
    sunlight_propagates = true,
    light_source = 2,
    collision_box = full_node_box,
    selection_box = full_node_box,
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
                    texture = 'shelter_computer_relay_particle.png',
                    animation = {
                        type = 'vertical_frames',
                        aspect_w = 16,
                        aspect_h = 16,
                        length = 5
                    }
                })

                minetest.sound_play({name = 'shelter_computer_relay_beep'}, {pos = neighbor.spawn, gain = 0.4})
            end
        end
    end,
})

minetest.register_node(mod.mod_str .. 'computer', {
    description = 'Computer',
	tiles = {
		'shelter_computer_relay_top.png',
		'shelter_computer_relay_top.png',
		'shelter_computer_side.png',
		'shelter_computer_side.png',
		'shelter_computer_side.png',
		'shelter_computer_side.png'
	},
	drawtype = 'nodebox',
	paramtype = 'light',
	node_box = {
		type = 'fixed',
		fixed = {
			{-0.5, 0.375, -0.5, 0.5, 0.5, 0.5},
			{-0.5, -0.5, -0.5, 0.5, -0.375, 0.5},
			{-0.4375, -0.4375, -0.375, -0.3125, 0.4375, 0.375},
			{0.3125, -0.4375, -0.375, 0.4375, 0.4375, 0.375},
			{-0.25, -0.4375, -0.4375, 0.25, 0.4375, 0.4375},
		}
    },
    is_ground_content = false,
    sunlight_propagates = true,
    light_source = 8,
    collision_box = full_node_box,
    selection_box = full_node_box,
})

minetest.register_abm({
    label = mod.mod_str .. 'computer_processing',
    nodenames = {mod.mod_str .. 'computer'},
    interval = 3 * 60 + 10,
    chance = 3,
    action = function(pos)
        minetest.add_particlespawner({
            amount = 120,
            time = 30,
            glow = 10,
            minpos = {x = pos.x, y = pos.y + 20, z = pos.z},
            maxpos = {x = pos.x, y = pos.y + 60, z = pos.z},
            minexptime = 1,
            maxexptime = 3,
            minsize = 1,
            maxsize = 6,
            minacc = {x = 0, y = -10, z = 0},
            maxacc = {x = 0, y = -30, z = 0},
            texture = 'shelter_computer_processing_particle.png',
            animation = {
                type = 'vertical_frames',
                aspect_w = 4,
                aspect_h = 16,
                length = 5
            }
        })

        minetest.sound_play({name = 'shelter_computer_processing'}, {pos = pos, gain = 0.2})
    end,
})

minetest.register_node(mod.mod_str .. 'rose', {
    description = 'Rose',
	tiles = {
		'shelter_rose_top.png',
		'shelter_rose_top.png',
		'shelter_rose_side.png',
		'shelter_rose_side.png',
		'shelter_rose_side.png',
		'shelter_rose_side.png'
	},
	drawtype = 'nodebox',
	paramtype = 'light',
	node_box = {
		type = 'fixed',
		fixed = {
			{-0.0625, -0.5, 0, 0, 0.1875, 0.0625},
			{-0.125, 0.1875, -0.0625, 0.0625, 0.4375, 0.125},
			{-0.0625, -0.0625, -0.1875, 0.0625, 0, 0},
			{-0.125, 0, 0.0625, 0, 0.0625, 0.25},
		}
    },
    is_ground_content = false,
    sunlight_propagates = true,
    walkable = false,
    buildable_to = true,
})

minetest.register_node(mod.mod_str .. 'purifier_air_basic', {
    description = 'Basic air purifier',
	tiles = {
		'shelter_purifier_air_basic.png'
	},
	drawtype = 'nodebox',
	paramtype = 'light',
	node_box = {
		type = 'fixed',
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.25, 0.5},
			{-0.5, 0.25, -0.5, 0.5, 0.5, 0.5},
			{-0.5, -0.25, -0.5, -0.25, 0.25, -0.25},
			{0.25, -0.25, -0.5, 0.5, 0.25, -0.25},
			{0.25, -0.25, 0.25, 0.5, 0.25, 0.5},
			{-0.5, -0.25, 0.25, -0.25, 0.25, 0.5},
			{-0.25, -0.25, -0.25, 0.25, 0.25, 0.25},
		}
    },
    is_ground_content = false,
    sunlight_propagates = true,
    walkable = true,
    collision_box = full_node_box,
    selection_box = full_node_box,
    groups = {oddly_breakable_by_hand = 1, machine = 1},
})

minetest.register_abm({
    label = mod.mod_str .. 'purifier_air_basic',
    nodenames = {mod.mod_str .. 'purifier_air_basic'},
    interval = 10.1,
    chance = 1,
    action = function(pos)
        mod.purify_air(pos, 8)

        minetest.add_particlespawner({
            amount = 15,
            time = 2,
            minpos = {x = pos.x + 1, y = pos.y - 0.3, z = pos.z - 0.3},
            maxpos = {x = pos.x + 3, y = pos.y + 0.3, z = pos.z + 0.3},
            minexptime = 0.1,
            maxexptime = 0.8,
            minsize = 2,
            maxsize = 6,
            minacc = {x = -10, y = 0, z = 0},
            maxacc = {x = -20, y = 0, z = 0},
            texture = 'shelter_purifier_air_particle.png'
        })

        minetest.sound_play({name = 'shelter_purifier_air_basic'}, {pos = pos, gain = 0.4})
    end,
})

-- todo: basic processor

-- todo: basic processor

-- todo: basic unstable processor

-- todo: basic recycler

-- todo: basic solar energy producer

-- todo: basic solar energy extender

-- todo: basic steam turbine

-- todo: basic water extractor

-- todo: basic distiller

-- todo basic air purifier

-- todo: basic tank

-- todo basic item hopper

-- todo basic tube

-- todo basic colored tube

-- todo basic input valve

-- todo basic output valve

-- todo basic force field