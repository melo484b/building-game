extends Node

var water = 0 setget set_water, get_water
var food = 0 setget set_food, get_food
var wood = 0 setget set_wood, get_wood
var stone = 0 setget set_stone, get_stone
var metal = 0 setget set_metal, get_metal
var gold = 0 setget set_gold, get_gold

func set_water(new_value):
	water = new_value
func get_water():
	return water
	
func set_food(new_value):
	food = new_value
func get_food():
	return food
	
func set_wood(new_value):
	wood = new_value
func get_wood():
	return wood
	
func set_stone(new_value):
	stone = new_value
func get_stone():
	return stone
	
func set_metal(new_value):
	metal = new_value
func get_metal():
	return metal
	
func set_gold(new_value):
	gold = new_value
func get_gold():
	return gold
