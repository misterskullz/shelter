local mod = shelter_machines

local helpers = shelter_helpers
local items = shelter_items


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
local basic_solar_tick_seconds = 10
local basic_solar_light_level = 12
local inv_produced = 'produced'
local production_bonus = 'production_bonus'
local form_basic_solar = 'size[8,9]' ..
    'list[context;' .. inv_produced ..';2,3;1,1;]' ..
    'list[current_player;main;0,5;8,4;]'

local basic_solar_on_timer = function(pos, elapsed)
    local meta = minetest.get_meta(pos)
    local light = minetest.get_node_light({x = pos.x, y = pos.y + 1, z = pos.z})
    local on_flag = meta:get_int('on') or 0

    if light >= basic_solar_light_level then
        local inv = meta:get_inventory()
        local production_bonus_val = meta:get_int(production_bonus) or 0

        inv:add_item(inv_produced, {name = items.energy_unit, count = 1 + production_bonus_val})
        meta:set_int(production_bonus, 0)

        if on_flag <= 0 then
            meta:set_int('on', 1)
            minetest.swap_node(pos, {name = mod.mod_str .. 'basic_solar_energy_producer_on'})
        end
    else 
        if on_flag > 0 then
            meta:set_int('on', 0)
            minetest.swap_node(pos, {name = mod.mod_str .. 'basic_solar_energy_producer_off'})
        end
    end

    local timer = minetest.get_node_timer(pos)
    timer:start(basic_solar_tick_seconds)
end

local basic_solar_on_construct = function(pos)
    local meta = minetest.get_meta(pos)
    meta:set_string('formspec', form_basic_solar)
    meta:set_int('on', 0)
    meta:set_int(production_bonus, 0)
    
    local inv = meta:get_inventory()
    inv:set_size(inv_produced, 1)

    local timer = minetest.get_node_timer(pos)
    timer:start(basic_solar_tick_seconds)
end

minetest.register_node(mod.mod_str .. 'basic_solar_energy_producer_off', {
    description = 'Basic solar engery producer',
	tiles = {
		'shelter_purifier_air_basic.png'  -- todo: fix image
	},
	drawtype = 'nodebox',
	--paramtype = 'light',
	node_box = {
		type = 'fixed',
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
		}
    },
    is_ground_content = false,
    sunlight_propagates = false,
    walkable = true,
    collision_box = full_node_box,
    selection_box = full_node_box,
    groups = {oddly_breakable_by_hand = 1, machine = 1, solar_producer = 1},
    on_timer = basic_solar_on_timer,
    on_construct = basic_solar_on_construct,
    drop = mod.mod_str .. 'basic_solar_energy_producer_off',
})

minetest.register_node(mod.mod_str .. 'basic_solar_energy_producer_on', {
    description = 'Basic solar engery producer',
	tiles = {
		'shelter_stone.png'  -- todo: fix image
	},
	drawtype = 'nodebox',
	--paramtype = 'light',
	node_box = {
		type = 'fixed',
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
		}
    },
    is_ground_content = false,
    sunlight_propagates = true,
    walkable = true,
    collision_box = full_node_box,
    selection_box = full_node_box,
    groups = {oddly_breakable_by_hand = 1, machine = 1, solar_producer = 1},
    on_timer = basic_solar_on_timer,
    on_construct = basic_solar_on_construct,
    drop = mod.mod_str .. 'basic_solar_energy_producer_off',
})

minetest.register_craft({
    output = mod.mod_str .. 'basic_solar_energy_producer_off',
    recipe = {
        {items.basic_material, items.basic_material, items.basic_material},
        {items.basic_material, items.basic_material, items.basic_material},
        {items.basic_material_frame, items.basic_material_frame, items.basic_material_frame },
    }
})
-- todo: basic solar energy extender
local basic_solar_extender_on_timer = function(pos, elapsed)
    local meta = minetest.get_meta(pos)
    local light = minetest.get_node_light({x = pos.x, y = pos.y + 1, z = pos.z})
    local on_flag = meta:get_int('on') or 0

    if light >= basic_solar_light_level then
        local bonus_pos = helpers.get_random_node_zx_position(pos, 1, 'group:solar_producer')
        if bonus_pos then
            local bonus_meta = minetest.get_meta(bonus_pos)
            local production_bonus_val = bonus_meta:get_int(production_bonus) or 0
            bonus_meta:set_int(production_bonus, production_bonus_val + 1)
        end

        if on_flag <= 0 then
            meta:set_int('on', 1)
            minetest.swap_node(pos, {name = mod.mod_str .. 'basic_solar_energy_extender_on'})
        end
    else 
        if on_flag > 0 then
            meta:set_int('on', 0)
            minetest.swap_node(pos, {name = mod.mod_str .. 'basic_solar_energy_extender_off'})
        end
    end

    local timer = minetest.get_node_timer(pos)
    timer:start(basic_solar_tick_seconds)
end

local basic_solar_extender_on_construct = function(pos)
    local timer = minetest.get_node_timer(pos)
    timer:start(basic_solar_tick_seconds)
end

minetest.register_node(mod.mod_str .. 'basic_solar_energy_extender_off', {
    description = 'Basic solar engery extender',
	tiles = {
		'shelter_purifier_air_basic.png'  -- todo: fix image
	},
	drawtype = 'nodebox',
	--paramtype = 'light',
	node_box = {
		type = 'fixed',
		fixed = {
			{-0.5, -0.0, -0.5, 0.5, 0.5, 0.5},
		}
    },
    is_ground_content = false,
    sunlight_propagates = false,
    walkable = true,
    collision_box = full_node_box,
    selection_box = full_node_box,
    groups = {oddly_breakable_by_hand = 1, machine = 1},
    on_timer = basic_solar_extender_on_timer,
    on_construct = basic_solar_extender_on_construct,
    drop = mod.mod_str .. 'basic_solar_energy_extender_off',
})

minetest.register_node(mod.mod_str .. 'basic_solar_energy_extender_on', {
    description = 'Basic solar engery extender',
	tiles = {
		'shelter_stone.png'  -- todo: fix image
	},
	drawtype = 'nodebox',
	--paramtype = 'light',
	node_box = {
		type = 'fixed',
		fixed = {
			{-0.5, -0.0, -0.5, 0.5, 0.5, 0.5},
		}
    },
    is_ground_content = false,
    sunlight_propagates = false,
    walkable = true,
    collision_box = full_node_box,
    selection_box = full_node_box,
    groups = {oddly_breakable_by_hand = 1, machine = 1},
    on_timer = basic_solar_extender_on_timer,
    on_construct = basic_solar_extender_on_construct,
    drop = mod.mod_str .. 'basic_solar_energy_extender_off',
})

minetest.register_craft({
    output = mod.mod_str .. 'basic_solar_energy_extender_off',
    recipe = {
        {items.basic_material, items.basic_material, items.basic_material},
        {items.basic_material, items.basic_material, items.basic_material},
        {'', items.basic_rod, '' },
    }
})


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