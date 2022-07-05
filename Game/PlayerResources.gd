extends Node

var water = 0 setget set_water, get_water
var food = 0 setget set_food, get_food
var wood = 0 setget set_wood, get_wood
var stone = 0 setget set_stone, get_stone
var metal = 0 setget set_metal, get_metal
var gold = 0 setget set_gold, get_gold

func set_water(new_value):
	if (water < 999):
		water = new_value
	else:
		water = 999
	
func get_water():
	return water
	
func set_food(new_value):
	if (food < 999):
		food = new_value
	else:
		food = 999
	
func get_food():
	return food
	
func set_wood(new_value):
	if (wood < 999):
		wood = new_value
	else:
		wood = 999
	
func get_wood():
	return wood
	
func set_stone(new_value):
	if (stone < 999):
		stone = new_value
	else:
		stone = 999
	
func get_stone():
	return stone
	
func set_metal(new_value):
	if (metal < 999):
		metal = new_value
	else:
		metal = 999
	
func get_metal():
	return metal
	
func set_gold(new_value):
	if (gold < 999):
		gold = new_value
	else:
		gold = 999
	
func get_gold():
	return gold

