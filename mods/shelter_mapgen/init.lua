shelter_mapgen = {}
local mod = shelter_mapgen


function mod.defs(table, dig, dug, foot, place, fail)
	table = table or {}

	if not table.dig then table.dig = dig end
	if not table.dug then table.dug = dug end
	if not table.footstep then table.footstep = foot end
	if not table.place then table.place = place end
	if not table.place_failed then table.place_failed = fail end

	return table
end

function mod.node_sound_defaults(table)
	return mod.defs(table, sound_wood_dig, sound_wood_dug, sound_wood_foot, sound_wood_place, sound_wood_fail)
end


local sound_grass_dig =   {name='shelter_dug_node', gain=1.0}
local sound_grass_dug =   {name='shelter_dug_node', gain=1.0}
local sound_grass_foot =  {name='shelter_dug_node', gain=1.0}
local sound_grass_place = {name='shelter_dug_node', gain=1.0}
local sound_grass_fail =  {name='shelter_dug_node', gain=1.0}

function mod.node_sound_grass_defaults(table)
	return mod.defs(table, sound_grass_dig, sound_grass_dug, sound_grass_foot, sound_grass_place, sound_grass_fail)
end


local sound_dirt_dig =   {name='shelter_dug_node', gain=1.0}
local sound_dirt_dug =   {name='shelter_dug_node', gain=1.0}
local sound_dirt_foot =  {name='shelter_dug_node', gain=1.0}
local sound_dirt_place = {name='shelter_dug_node', gain=1.0}
local sound_dirt_fail =  {name='shelter_dug_node', gain=1.0}

function mod.node_sound_dirt_defaults(table)
	return mod.defs(table, sound_dirt_dig, sound_dirt_dug, sound_dirt_foot, sound_dirt_place, sound_dirt_fail)
end


local sound_sand_dig =   {name='shelter_dug_node', gain=1.0}
local sound_sand_dug =   {name='shelter_dug_node', gain=1.0}
local sound_sand_foot =  {name='shelter_dug_node', gain=1.0}
local sound_sand_place = {name='shelter_dug_node', gain=1.0}
local sound_sand_fail =  {name='shelter_dug_node', gain=1.0}

function mod.node_sound_sand_defaults(table)
	return mod.defs(table, sound_dirt_dig, sound_dirt_dug, sound_dirt_foot, sound_dirt_place, sound_dirt_fail)
end


local sound_gravel_dig =   {name='shelter_dug_node', gain=1.0}
local sound_gravel_dug =   {name='shelter_dug_node', gain=1.0}
local sound_gravel_foot =  {name='shelter_dug_node', gain=1.0}
local sound_gravel_place = {name='shelter_dug_node', gain=1.0}
local sound_gravel_fail =  {name='shelter_dug_node', gain=1.0}

function mod.node_sound_gravel_defaults(table)
	return mod.defs(table, sound_dirt_dig, sound_dirt_dug, sound_dirt_foot, sound_dirt_place, sound_dirt_fail)
end


local sound_wood_dig =   {name='shelter_dug_node', gain=1.0}
local sound_wood_dug =   {name='shelter_dug_node', gain=1.0}
local sound_wood_foot =  {name='shelter_dug_node', gain=1.0}
local sound_wood_place = {name='shelter_dug_node', gain=1.0}
local sound_wood_fail =  {name='shelter_dug_node', gain=1.0}

function mod.node_sound_wood_defaults(table)
	return mod.defs(table, sound_wood_dig, sound_wood_dug, sound_wood_foot, sound_wood_place, sound_wood_fail)
end


local sound_leaves_dig =   {name='shelter_dug_node', gain=1.0}
local sound_leaves_dug =   {name='shelter_dug_node', gain=1.0}
local sound_leaves_foot =  {name='shelter_dug_node', gain=1.0}
local sound_leaves_place = {name='shelter_dug_node', gain=1.0}
local sound_leaves_fail =  {name='shelter_dug_node', gain=1.0}

function mod.node_sound_leaves_defaults(table)
	return mod.defs(table, sound_wood_dig, sound_wood_dug, sound_wood_foot, sound_wood_place, sound_wood_fail)
end


local sound_stone_dig =   {name='shelter_dug_node', gain=1.0}
local sound_stone_dug =   {name='shelter_dug_node', gain=1.0}
local sound_stone_foot =  {name='shelter_dug_node', gain=1.0}
local sound_stone_place = {name='shelter_dug_node', gain=1.0}
local sound_stone_fail =  {name='shelter_dug_node', gain=1.0}

function mod.node_sound_stone_defaults(table)
	return mod.defs(table, sound_wood_dig, sound_wood_dug, sound_wood_foot, sound_wood_place, sound_wood_fail)
end


local sound_metal_dig =   {name='shelter_dug_node', gain=1.0}
local sound_metal_dug =   {name='shelter_dug_node', gain=1.0}
local sound_metal_foot =  {name='shelter_dug_node', gain=1.0}
local sound_metal_place = {name='shelter_dug_node', gain=1.0}
local sound_metal_fail =  {name='shelter_dug_node', gain=1.0}

function mod.node_sound_metal_defaults(table)
	return mod.defs(table, sound_wood_dig, sound_wood_dug, sound_wood_foot, sound_wood_place, sound_wood_fail)
end


local sound_glass_dig =   {name='shelter_dug_node', gain=1.0}
local sound_glass_dug =   {name='shelter_dug_node', gain=1.0}
local sound_glass_foot =  {name='shelter_dug_node', gain=1.0}
local sound_glass_place = {name='shelter_dug_node', gain=1.0}
local sound_glass_fail =  {name='shelter_dug_node', gain=1.0}

function mod.node_sound_glass_defaults(table)
	return mod.defs(table, sound_wood_dig, sound_wood_dug, sound_wood_foot, sound_wood_place, sound_wood_fail)
end