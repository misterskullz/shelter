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

-- todo: basic processor
local basic_processor_tick_seconds = 10
local inv_produced = 'produced'
local inv_fuel = 'fuel'
local inv_src = 'src'
local production_bonus = 'production_bonus'
local form_basic_processor = 'size[8,9]' ..
    'list[context;' .. inv_src ..';2,1;1,1;]' ..
    'list[context;' .. inv_fuel ..';2,2;1,1;]' ..
    'list[context;' .. inv_produced ..';2,3;1,1;]' ..
    'list[current_player;main;0,5;8,4;]'

local basic_processor_on_timer = function(pos, elapsed)
    local meta = minetest.get_meta(pos)
    local light = minetest.get_node_light({x = pos.x, y = pos.y + 1, z = pos.z})
    local on_flag = meta:get_int('on') or 0

    if light >= basic_producer_light_level then
        local inv = meta:get_inventory()
        local production_bonus_val = meta:get_int(production_bonus) or 0

        inv:add_item(inv_produced, {name = items.energy_unit, count = 1 + production_bonus_val})
        meta:set_int(production_bonus, 0)

        if on_flag <= 0 then
            meta:set_int('on', 1)
            minetest.swap_node(pos, {name = mod.mod_str .. 'basic_producer_energy_producer_on'})
        end
    else 
        if on_flag > 0 then
            meta:set_int('on', 0)
            minetest.swap_node(pos, {name = mod.mod_str .. 'basic_producer_energy_producer_off'})
        end
    end

    local timer = minetest.get_node_timer(pos)
    timer:start(basic_processor_tick_seconds)
end

local basic_processor_on_construct = function(pos)
    local meta = minetest.get_meta(pos)
    meta:set_string('formspec', form_basic_processor)
    meta:set_int('on', 0)
    meta:set_int(production_bonus, 0)
    
    local inv = meta:get_inventory()
    inv:set_size(inv_produced, 1)
    inv:set_size(inv_fuel, 1)
    inv:set_size(inv_src, 1)

    local timer = minetest.get_node_timer(pos)
    timer:start(basic_processor_tick_seconds)
end

local basic_processor_off = mod.mod_str .. 'basic_processor_off'
mod.basic_processor_off = basic_processor_off
local basic_processor_on = mod.mod_str .. 'basic_processor_on'
mod.basic_processor_on = basic_processor_on

minetest.register_node(basic_processor_off, {
    description = 'Basic processor',
	tiles = basic_tiles_off,
	drawtype = 'nodebox',
	--paramtype = 'light',
	node_box = full_node_box,
    is_ground_content = false,
    sunlight_propagates = false,
    walkable = true,
    collision_box = full_node_box,
    selection_box = full_node_box,
    groups = {oddly_breakable_by_hand = 1, machine = 1, tube_put = 1, tube_get = 1},
    on_timer = basic_processor_on_timer,
    on_construct = basic_processor_on_construct,
    drop = basic_processor_off,
})

minetest.register_node(mod.mod_str .. 'basic_processor_on', {
    description = 'Basic processor',
	tiles = basic_tiles_on,
	drawtype = 'nodebox',
	--paramtype = 'light',
	node_box = full_node_box,
    is_ground_content = false,
    sunlight_propagates = false,
    walkable = true,
    collision_box = full_node_box,
    selection_box = full_node_box,
    groups = {oddly_breakable_by_hand = 1, machine = 1, tube_put = 1, tube_get = 1},
    on_timer = basic_producer_on_timer,
    on_construct = basic_producer_on_construct,
    drop = basic_processor_off,
})

minetest.register_craft({
    output = basic_processor_off,
    recipe = {
        {items.basic_material, items.basic_material_frame, items.basic_material},
        {items.basic_material, items.basic_material, items.basic_material},
        {items.basic_material_frame, items.basic_material_frame, items.basic_material_frame },
    }
})

minetest.register_craft(
    {
        type = 'cooking',
        output = items.basic_material,
        recipe = 'shelter_mapgen:sand',
        cooktime = 3
    }
)