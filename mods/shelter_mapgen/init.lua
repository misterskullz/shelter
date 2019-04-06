shelter_mapgen = {}
local mod = shelter_mapgen

local path = minetest.get_modpath("shelter_mapgen") .. '/'
local player_head_offset = 1
local mt_air = 'air'
local toxic_air = 'shelter_mapgen:air_toxic'
local pure_air = 'shelter_mapgen:air'

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

function mod.replace_air_around(pos)
	if not pos then return end

	local d = 16
	local offset = {x = d, y = d, z = d}
	local pos1 = vector.subtract(pos, offset)
	local pos2 = vector.add(pos, offset)

	local air_nodes = minetest.find_nodes_in_area(pos1, pos2, { mt_air })
	minetest.bulk_set_node(air_nodes, { name = toxic_air })
end

function mod.adjust_sky(player)
	local pos = player:get_pos()
	local head_pos = {x = pos.x, y = pos.y + player_head_offset, z = pos.z}

	local node = minetest.get_node(head_pos)
	
	if node.name == pure_air then
		player:set_sky('#ffffff', 'regular', true)
		player:set_clouds({
			density = 0.4,
			color = '#fff0f0e5',
			ambient = '#000000',
			height = '120',
			thickness = '16',
			speed = {x = -1, z = -2}
		})
	else
		player:set_sky('#c7ffe3', 'plain', true)
		player:set_clouds({
			density = 0.6,
			color = '#a5e32be5',
			ambient = '#a5e32b',
			height = '300',
			thickness = '64',
			speed = {x = 8, z = 64}
		})
	end
end

minetest.register_globalstep(function(dtime)
	for _,player in ipairs(minetest.get_connected_players()) do
		mod.replace_air_around(player:get_pos())
		mod.adjust_sky(player)
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