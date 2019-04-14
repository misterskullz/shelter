local mod = shelter_items

-- Todo: material scrap

local scrap = mod.mod_str .. 'material_scrap'
mod.scrap = scrap
minetest.register_craftitem(scrap, {
	description = "Basic material scrap",
	inventory_image = "shelter_material_scrap.png",
	groups = {}
})

-- Todo: basic material

local basic_material = mod.mod_str .. 'material_basic'
mod.basic_material = basic_material
minetest.register_craftitem(basic_material, {
	description = "Basic material",
	inventory_image = "shelter_material_basic.png",
	groups = {}
})

minetest.register_craft({
    output = basic_material,
    recipe = {
        {scrap, scrap, scrap},
        {scrap, scrap, scrap},
        {scrap, scrap, scrap},
    }
})

-- todo: unstable material

local basic_material_unstable = mod.mod_str .. 'material_basic_unstable'
mod.basic_material_unstable = basic_material_unstable
minetest.register_craftitem(basic_material_unstable, {
	description = "Basic unstable material",
	inventory_image = "shelter_material_basic_unstable.png",
	groups = {}
})

-- used in unstable processor
minetest.register_craft({
    type = 'cooking',
    output = basic_material_unstable,
    recipe = basic_material,
    cooktime = 2
})

-- todo: thick basic material

-- todo: basic machine frame

local basic_material_frame = mod.mod_str .. 'material_basic_frame'
mod.basic_material_frame = basic_material_frame
minetest.register_craftitem(basic_material_frame, {
	description = "Basic frame",
	inventory_image = "shelter_material_basic_frame.png",
	groups = {}
})
minetest.register_craft({
    output = basic_material_frame,
    recipe = {
        {basic_material, basic_material, basic_material},
        {basic_material,      '',        basic_material},
        {basic_material, basic_material, basic_material},
    }
})

-- todo: thick basic machine frame

-- todo: basic rod

local basic_rod = mod.mod_str .. 'basic_rod'
mod.basic_rod = basic_rod
minetest.register_craftitem(basic_rod, {
	description = "Basic rod",
	inventory_image = "shelter_material_basic_rod.png",
	groups = {}
})

minetest.register_craft({
    output = basic_rod,
    recipe = {
        {basic_material, '', ''},
        {basic_material, '', ''},
        {basic_material, '', ''},
    }
})
minetest.register_craft({
    output = basic_rod,
    recipe = {
        {'', basic_material, ''},
        {'', basic_material, ''},
        {'', basic_material, ''},
    }
})
minetest.register_craft({
    output = basic_rod,
    recipe = {
        {'', '', basic_material},
        {'', '', basic_material},
        {'', '', basic_material},
    }
})
