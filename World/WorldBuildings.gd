extends Node

# WorldBuildings keeps track of building locations so they cannot be placed on top of one another.

var buildings = []

func add_building_location(location: Vector2) -> void:
	buildings.append(location)

func remove_building_location(location: Vector2) -> void:
	buildings.erase(location)

func is_location_empty(location: Vector2) -> bool:
	return !buildings.has(location)
