local mod = shelter_items

minetest.register_craftitem(mod.mod_str .. 'energy_unit', {
	description = "Energy unit",
	inventory_image = "shelter_energy_unit.png",
	groups = {}
})

minetest.register_craft({
    type = 'fuel',
    recipe = mod.mod_str .. 'energy_unit',
    burntime = 1,
})

minetest.register_craftitem(mod.mod_str .. 'material_basic', {
	description = "Basic material",
	inventory_image = "shelter_material_basic.png",
	groups = {}
})