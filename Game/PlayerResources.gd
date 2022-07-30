extends Node

var resources_available: Dictionary = {
	"water": 50,
	"food": 50,
	"wood": 50,
	"stone": 50,
	"metal": 0,
	"gold": 0
	}



func add_resource(resource_name: String, amount: int) -> void:
	if resources_available.has(resource_name): # checks to see if key exixts in dictionary
		if (resources_available[resource_name] < 999):
			resources_available[resource_name] += amount
		else:
			resources_available[resource_name] = 999
	else:
		assert(false, "This resource is invalid.")

func remove_resource(resource_name: String, amount: int) -> void:
	if resources_available.has(resource_name): # checks to see if key exixts in dictionary
		if (resources_available[resource_name] < 0):
			#TODO:Add some sort of way to notify player of not enough resource 
			return
		else:
			resources_available[resource_name] -= amount
	else:
		assert(false, "This resource is invalid.")

func get_resource(resource_name: String) -> int:
	if resources_available.has(resource_name): # checks to see if key exixts in dictionary
		return resources_available[resource_name]
	else:
		assert(false, "This resource is invalid.")
		return -0 # Added to remove return type error 
	

func set_water(new_value) -> void:
	if (resources_available["water"] < 999):
		resources_available["water"] = new_value
	else:
		resources_available["water"] = 999
	
func get_water() -> int:
	return resources_available["water"]
	
func set_food(new_value) -> void:
	if (resources_available["food"] < 999):
		resources_available["food"] = new_value
	else:
		resources_available["food"] = 999
	
func get_food() -> int:
	return resources_available["food"]
	
func set_wood(new_value) -> void:
	if (resources_available["wood"] < 999):
		resources_available["wood"] = new_value
	else:
		resources_available["wood"] = 999
	
func get_wood() -> int:
	return resources_available["wood"]
	
func set_stone(new_value) -> void:
	if (resources_available["stone"] < 999):
		resources_available["stone"] = new_value
	else:
		resources_available["stone"] = 999
	
func get_stone() -> int:
	return resources_available["stone"]
	
func set_metal(new_value) -> void:
	if (resources_available["metal"] < 999):
		resources_available["metal"] = new_value
	else:
		resources_available["metal"] = 999
	
func get_metal() -> int:
	return resources_available["metal"]
	
func set_gold(new_value) -> void:
	if (resources_available["gold"] < 999):
		resources_available["gold"] = new_value
	else:
		resources_available["gold"] = 999
	
func get_gold() -> int:
	return resources_available["gold"]

func get_resource_by_name(resource_name) -> int:
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

func set_resource_by_name(resource_name, new_resource_amount) -> void:
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

func check_resource(resource_name : String, amount : int) -> bool:
	if (int(resources_available[resource_name]) > amount):
		return true
	else:
		return false
