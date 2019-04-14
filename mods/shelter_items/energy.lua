local mod = shelter_items

local energy_unit = mod.mod_str .. 'energy_unit'
mod.energy_unit = energy_unit
minetest.register_craftitem(energy_unit, {
	description = "Energy unit",
	inventory_image = "shelter_energy_unit.png",
	groups = {}
})

minetest.register_craft({
    type = 'fuel',
    recipe = mod.mod_str .. 'energy_unit',
    burntime = 1,
})

