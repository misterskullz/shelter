local mod = shelter_machines

local helpers = shelter_helpers
local items = shelter_items


local full_node_box = {
    type = 'fixed',
    fixed = {-0.5, -0.5, -0.5, 0.5, 0.5, 0.5}
}

local basic_tiles_off = {
    'shelter_producer_solar_basic_top_off.png',
    'shelter_machine_bottom.png',
    'shelter_producer_solar_basic_side.png',
    'shelter_producer_solar_basic_side.png',
    'shelter_producer_solar_basic_side.png',
    'shelter_producer_solar_basic_side.png',
}

local basic_tiles_on = {
    'shelter_producer_solar_basic_top_on.png',
    'shelter_machine_bottom.png',
    'shelter_producer_solar_basic_side.png',
    'shelter_producer_solar_basic_side.png',
    'shelter_producer_solar_basic_side.png',
    'shelter_producer_solar_basic_side.png',
}

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
	tiles = basic_tiles_off,
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
    groups = {oddly_breakable_by_hand = 1, machine = 1, solar_producer = 1, tube_put = 1},
    on_timer = basic_solar_on_timer,
    on_construct = basic_solar_on_construct,
    drop = mod.mod_str .. 'basic_solar_energy_producer_off',
})

minetest.register_node(mod.mod_str .. 'basic_solar_energy_producer_on', {
    description = 'Basic solar engery producer',
	tiles = basic_tiles_on,
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
    groups = {oddly_breakable_by_hand = 1, machine = 1, solar_producer = 1, tube_put = 1},
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

local extender_nodebox = {
    type = 'fixed',
    fixed = {
        {-0.5, 0.25, -0.5, 0.5, 0.5, 0.5},
    }
}

minetest.register_node(mod.mod_str .. 'basic_solar_energy_extender_off', {
    description = 'Basic solar engery extender',
	tiles = basic_tiles_off,
	drawtype = 'nodebox',
	--paramtype = 'light',
	node_box = extender_nodebox,
    is_ground_content = false,
    sunlight_propagates = false,
    walkable = true,
    collision_box = full_node_box,
    selection_box = extender_nodebox,
    groups = {oddly_breakable_by_hand = 1, machine = 1},
    on_timer = basic_solar_extender_on_timer,
    on_construct = basic_solar_extender_on_construct,
    drop = mod.mod_str .. 'basic_solar_energy_extender_off',
})

minetest.register_node(mod.mod_str .. 'basic_solar_energy_extender_on', {
    description = 'Basic solar engery extender',
	tiles = basic_tiles_on,
	drawtype = 'nodebox',
	--paramtype = 'light',
	node_box = extender_nodebox,
    is_ground_content = false,
    sunlight_propagates = false,
    walkable = true,
    collision_box = full_node_box,
    selection_box = extender_nodebox,
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