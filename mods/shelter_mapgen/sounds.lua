local mod = shelter_mapgen

-- todo: add all sounds

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


local sound_grass_dig =   {name='shelter_grass_dig', gain=1.0}
local sound_grass_dug =   {name='shelter_grass_dug', gain=1.0}
local sound_grass_foot =  {name='shelter_grass_foot', gain=1.0}
local sound_grass_place = {name='shelter_grass_place', gain=1.0}
local sound_grass_fail =  {name='shelter_grass_fail', gain=1.0}

function mod.node_sound_grass_defaults(table)
	return mod.defs(table, sound_grass_dig, sound_grass_dug, sound_grass_foot, sound_grass_place, sound_grass_fail)
end


local sound_dirt_dig =   {name='shelter_dirt_dig', gain=1.0}
local sound_dirt_dug =   {name='shelter_dirt_dug', gain=1.0}
local sound_dirt_foot =  {name='shelter_dirt_foot', gain=1.0}
local sound_dirt_place = {name='shelter_dirt_place', gain=1.0}
local sound_dirt_fail =  {name='shelter_dirt_fail', gain=1.0}

function mod.node_sound_dirt_defaults(table)
	return mod.defs(table, sound_dirt_dig, sound_dirt_dug, sound_dirt_foot, sound_dirt_place, sound_dirt_fail)
end


local sound_sand_dig =   {name='shelter_sand_dig', gain=1.0} --
local sound_sand_dug =   {name='shelter_sand_dug', gain=1.0} --
local sound_sand_foot =  {name='shelter_sand_foot', gain=1.0}
local sound_sand_place = {name='shelter_sand_place', gain=1.0}
local sound_sand_fail =  {name='shelter_sand_fail', gain=1.0}

function mod.node_sound_sand_defaults(table)
	return mod.defs(table, sound_sand_dig, sound_sand_dug, sound_sand_foot, sound_sand_place, sound_sand_fail)
end


local sound_gravel_dig =   {name='shelter_gravel_dig', gain=1.0}
local sound_gravel_dug =   {name='shelter_gravel_dug', gain=1.0}
local sound_gravel_foot =  {name='shelter_gravel_foot', gain=1.0}
local sound_gravel_place = {name='shelter_gravel_place', gain=1.0}
local sound_gravel_fail =  {name='shelter_gravel_fail', gain=1.0}

function mod.node_sound_gravel_defaults(table)
	return mod.defs(table, sound_gravel_dig, sound_gravel_dug, sound_gravel_foot, sound_gravel_place, sound_gravel_fail)
end


local sound_wood_dig =   {name='shelter_wood_dig', gain=1.0}
local sound_wood_dug =   {name='shelter_wood_dug', gain=1.0}
local sound_wood_foot =  {name='shelter_wood_foot', gain=1.0}
local sound_wood_place = {name='shelter_wood_place', gain=1.0}
local sound_wood_fail =  {name='shelter_wood_fail', gain=1.0}

function mod.node_sound_wood_defaults(table)
	return mod.defs(table, sound_wood_dig, sound_wood_dug, sound_wood_foot, sound_wood_place, sound_wood_fail)
end


local sound_leaves_dig =   {name='shelter_leaves_dig', gain=1.0}
local sound_leaves_dug =   {name='shelter_leaves_dug', gain=1.0}
local sound_leaves_foot =  {name='shelter_leaves_foot', gain=1.0}
local sound_leaves_place = {name='shelter_leaves_place', gain=1.0}
local sound_leaves_fail =  {name='shelter_leaves_fail', gain=1.0}

function mod.node_sound_leaves_defaults(table)
	return mod.defs(table, sound_leaves_dig, sound_leaves_dug, sound_leaves_foot, sound_leaves_place, sound_leaves_fail)
end


local sound_stone_dig =   {name='shelter_stone_dig', gain=1.0}
local sound_stone_dug =   {name='shelter_stone_dug', gain=1.0}
local sound_stone_foot =  {name='shelter_stone_foot', gain=1.0}
local sound_stone_place = {name='shelter_stone_place', gain=1.0}
local sound_stone_fail =  {name='shelter_stone_fail', gain=1.0}

function mod.node_sound_stone_defaults(table)
	return mod.defs(table, sound_stone_dig, sound_stone_dug, sound_stone_foot, sound_stone_place, sound_stone_fail)
end


local sound_metal_dig =   {name='shelter_metal_dig', gain=1.0}
local sound_metal_dug =   {name='shelter_metal_dug', gain=1.0}
local sound_metal_foot =  {name='shelter_metal_foot', gain=1.0}
local sound_metal_place = {name='shelter_metal_place', gain=1.0}
local sound_metal_fail =  {name='shelter_metal_fail', gain=1.0}

function mod.node_sound_metal_defaults(table)
	return mod.defs(table, sound_metal_dig, sound_metal_dug, sound_metal_foot, sound_metal_place, sound_metal_fail)
end


local sound_glass_dig =   {name='shelter_glass_dig', gain=1.0}
local sound_glass_dug =   {name='shelter_glass_dug', gain=1.0}
local sound_glass_foot =  {name='shelter_glass_foot', gain=1.0}
local sound_glass_place = {name='shelter_glass_place', gain=1.0}
local sound_glass_fail =  {name='shelter_glass_fail', gain=1.0}

function mod.node_sound_glass_defaults(table)
	return mod.defs(table, sound_glass_dig, sound_glass_dug, sound_glass_foot, sound_glass_place, sound_glass_fail)
end