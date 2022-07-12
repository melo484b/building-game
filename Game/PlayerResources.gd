extends Node

var resources_available = {
	"water": 0,
	"food": 0,
	"wood": 0,
	"stone": 0,
	"metal": 0,
	"gold": 0
	}

func set_water(new_value):
	if (resources_available["water"] < 999):
		resources_available["water"] = new_value
	else:
		resources_available["water"] = 999
	
func get_water():
	return resources_available["water"]
	
func set_food(new_value):
	if (resources_available["food"] < 999):
		resources_available["food"] = new_value
	else:
		resources_available["food"] = 999
	
func get_food():
	return resources_available["food"]
	
func set_wood(new_value):
	if (resources_available["wood"] < 999):
		resources_available["wood"] = new_value
	else:
		resources_available["wood"] = 999
	
func get_wood():
	return resources_available["wood"]
	
func set_stone(new_value):
	if (resources_available["stone"] < 999):
		resources_available["stone"] = new_value
	else:
		resources_available["stone"] = 999
	
func get_stone():
	return resources_available["stone"]
	
func set_metal(new_value):
	if (resources_available["metal"] < 999):
		resources_available["metal"] = new_value
	else:
		resources_available["metal"] = 999
	
func get_metal():
	return resources_available["metal"]
	
func set_gold(new_value):
	if (resources_available["gold"] < 999):
		resources_available["gold"] = new_value
	else:
		resources_available["gold"] = 999
	
func get_gold():
	return resources_available["gold"]

func get_resource_by_name(resource_name):
	if (resource_name == "water"):
		return get_water()
	elif (resource_name == "food"):
		return get_food()
	elif (resource_name == "wood"):
		return get_wood()
	elif (resource_name == "stone"):
		return get_stone()
	elif (resource_name == "metal"):
		return get_metal()
	elif (resource_name == "gold"):
		return get_gold()
	else:
		print("Invalid material request.")
		return -1

func set_resource_by_name(resource_name, new_resource_amount):
	if (resource_name == "water"):
		set_water(new_resource_amount)
	elif (resource_name == "food"):
		set_food(new_resource_amount)
	elif (resource_name == "wood"):
		set_wood(new_resource_amount)
	elif (resource_name == "stone"):
		set_stone(new_resource_amount)
	elif (resource_name == "metal"):
		set_metal(new_resource_amount)
	elif (resource_name == "gold"):
		set_gold(new_resource_amount)
	else:
		print("No valid material to set.")
