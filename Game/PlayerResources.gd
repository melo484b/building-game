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
		resources_available[resource_name] = clamp(resources_available[resource_name] + amount, resources_available[resource_name], 999)
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
		return -1 # Added to remove return type error 
	

func check_resource(resource_name : String, amount : int) -> bool:
	if (int(resources_available[resource_name]) > amount):
		return true
	else:
		return false
