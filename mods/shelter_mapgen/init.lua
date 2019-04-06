shelter_mapgen = {}
local mod = shelter_mapgen

local path = minetest.get_modpath("shelter_mapgen") .. '/'

dofile(path .. 'sounds.lua')
dofile(path .. 'nodes.lua')
dofile(path .. 'mapgen.lua')

-- The hand
minetest.register_item(":", {
	type = "none",
	wield_image = "wieldhand.png",
	wield_scale = {x=1,y=1,z=2.5},
	tool_capabilities = {
		full_punch_interval = 0.9,
		max_drop_level = 0,
		groupcaps = {
			crumbly = {times={[2]=3.00, [3]=0.70}, uses=0, maxlevel=1},
			snappy = {times={[3]=0.40}, uses=0, maxlevel=1},
			oddly_breakable_by_hand = {times={[1]=3.50,[2]=2.00,[3]=0.70}, uses=0}
		},
		damage_groups = {fleshy=1},
	}
})

--[[
minetest.register_abm({
	label = 'Replace air nodes',
	name = 'shelter_mapgen:replace_air_nodes',
	nodenames = {'air'},
	interval = 1,
	chance = 1,
	action = function(pos, node)
		minetest.add_node(pos, {name='shelter_mapgen:air_toxic'})
	end,
})
]]--

function mod.replace_air_around(pos)
	if not pos then return end

	local d = 16
	local offset = {x = d, y = d, z = d}
	local pos1 = vector.subtract(pos, offset)
	local pos2 = vector.add(pos, offset)

	local air_nodes = minetest.find_nodes_in_area(pos1, pos2, {'air'})
	minetest.bulk_set_node(air_nodes, {name='shelter_mapgen:air_toxic'})
	--for i = 1, #air_nodes do
	--	minetest.add_node(air_nodes[i], 'shelter_mapgen:air_toxic')
	--end
end

minetest.register_globalstep(function(dtime)
	for _,player in ipairs(minetest.get_connected_players()) do
		mod.replace_air_around(player:get_pos())
	end
end)

minetest.register_on_joinplayer(function(player)
	player:set_sky('#c7ffe3', 'plain', true)
	player:set_clouds({
		density = 0.6,
		color = '#a5e32be5',
		ambient = '#a5e32b',
		height = '300',
		thickness = '64',
		speed = {x = 8, z = 64}
	})
end)