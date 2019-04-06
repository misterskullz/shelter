-- GENERATED CODE
-- Node Box Editor, version 0.9.0
-- Namespace: test

minetest.register_node("test:node_1", {
	tiles = {
		"shelter_computer_relay_top.png",
		"shelter_computer_relay_top.png",
		"shelter_computer_relay_side.png",
		"shelter_computer_relay_side.png",
		"shelter_computer_relay_side.png",
		"shelter_computer_relay_side.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.4375, -0.5, -0.4375, 0.4375, -0.3125, 0.4375}, -- NodeBox1
			{-0.4375, 0.3125, -0.4375, 0.4375, 0.5, 0.4375}, -- NodeBox2
			{-0.3125, -0.375, -0.3125, 0.3125, 0.375, 0.3125}, -- NodeBox3
			{-0.25, -0.1875, -0.5, 0.25, 0.1875, 0.5}, -- NodeBox4
			{-0.5, -0.1875, -0.25, 0.5, 0.1875, 0.25}, -- NodeBox5
		}
	}
})

