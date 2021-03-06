shelter_helpers = {}
local mod = shelter_helpers
mod.mod_str = 'shelter_helpers:'

function mod.get_nodes_around_position(pos, distance, node_name)
	local d = distance
	local offset = {x = d, y = d, z = d}
	local pos1 = vector.subtract(pos, offset)
	local pos2 = vector.add(pos, offset)

	return minetest.find_nodes_in_area(pos1, pos2, { node_name })
end

function mod.get_nodes_around_position_xz_plane(pos, distance, node_name)
	local d = distance
	local offset = {x = d, y = 0, z = d}
	local pos1 = vector.subtract(pos, offset)
	local pos2 = vector.add(pos, offset)

	return minetest.find_nodes_in_area(pos1, pos2, { node_name })
end


function mod.replace_nodes_around_position(pos, distance, search_node_name, replacer_node_name)
	local nodes = mod.get_nodes_around_position(pos, distance, search_node_name)
	minetest.bulk_set_node(nodes, { name = replacer_node_name })
end

function mod.get_random_node_zx_position(pos, distance, search_node_name)
	local nodes = mod.get_nodes_around_position_xz_plane(pos, distance, search_node_name)

	if #nodes > 0 then
		local r = math.random(1, #nodes)
		return nodes[r]
	else
		return nil
	end
end