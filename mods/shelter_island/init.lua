shelter_island = {}
local mod = shelter_island

local path = minetest.get_modpath('shelter_island') .. '/'
local max_pregen = tonumber(minetest.settings:get('shelter_island.max_pregen')) or 16
local spawn_spread = tonumber(minetest.settings:get('shelter_island.spawn_spread')) or 128
local search_radius = tonumber(minetest.settings:get('shelter_island.search_radius')) or 256
local max_distance = tonumber(minetest.settings:get('shelter_island.max_distance')) or 1000
local world_spawn = minetest.string_to_pos(minetest.settings:get('shelter_island.world_spawn')) or {x = 0, y = 0, z = 0}
local store = minetest.get_mod_storage()

dofile(path .. 'islands.lua')

function mod.get_all_spawns()
	local list = store:to_table()
	local spawns = {}

	if list then
		for _,hash in pairs(spawns) do
			local pos = minetest.get_position_from_hash(hash)
			spawns[#spawns + 1] = pos
		end
	end

	return spawns
end

function mod.spawn_away_from_players(pos, spawns)
	local okay = true

	for _,spawn in pairs(spawns) do
		local d = vector.distance(pos, spawn)
		
		if d <= spawn_spread then
			okay = false
			break
		end
	end

	return okay
end

function mod.find_spawn_position()
	local max_iterations = 10
	local spawns = mod.get_all_spawns()

	for i = 1, max_iterations do
		local x = math.random(world_spawn.x - max_distance, world_spawn.x + max_distance)
		local z = math.random(world_spawn.z - max_distance, world_spawn.z + max_distance)

		minetest.emerge_area({x = x - 1, y = 0, z = z - 1}, {x = x + 1, y = 0, z = z + 1})
		local y = minetest.get_spawn_level(x, z)
		
		if y then
			local pos = {x = x, y = y, z = z}
			
			minetest.debug('find_spawn_position checking ' .. minetest.pos_to_string(pos))

			if mod.spawn_away_from_players(pos, spawns) then
				return pos
			end
		end

		i = i + 1
	end

	return nil
end


function mod.create_island(pos)
	local schem = mod.schematic_island_00.schem
	local offset = mod.schematic_island_00.ground_offset
	local place_pos = {x = pos.x, y = pos.y, z = pos.z}
	minetest.place_schematic(place_pos, schem, 'random', nil, true, {place_center_x = true, place_center_y = true, place_center_z = true})
end

function mod.reset_island()
	local name
	local hash
	local spawn = minetest.get_position_from_hash(hash)

	store:set_string(name, '')
end

function mod.new_player(player)
	local name = player:get_player_name()
	local pos = mod.find_spawn_position()
	local spawn = {x = pos.x, y = pos.y + 2, z = pos.z}

	minetest.debug('spawn pos found ' .. minetest.pos_to_string(spawn))

	local hash  = minetest.hash_node_position(spawn)

	store:set_string(name, hash)

	mod.create_island(pos)
	player:set_pos(spawn)
end

minetest.register_on_joinplayer(function(player)
	local name = player:get_player_name()
	local hash = store:get_string(name)

	minetest.debug('register_on_joinplayer hash [' .. hash .. ']')

	if (not hash) or (string.len(hash) <= 0) then
		mod.new_player(player)
	end
end)

minetest.register_on_newplayer(mod.new_player)