extends Node

# WorldNodes keeps track of building & resource node locations.
# This prevents buildings from being placed on top of one another,
# and allows checking for appropriate building placement regarding nodes.

var buildings = []
var resource_nodes = {}
var resource_node_keys = null

const NODE_RANGE: float = 45.0

# Building functions
func add_building_location(location: Vector2) -> void:
	buildings.append(location)

func remove_building_location(location: Vector2) -> void:
	buildings.erase(location)

func is_location_empty(location: Vector2) -> bool:
	return !buildings.has(location)

# Resource node functions
func add_resource_location(resource_location: Vector2, resource_type: String) -> void:
	resource_nodes[resource_location] = resource_type

func remove_resource_location(resource_location: Vector2):
	resource_nodes.erase(resource_location)

func get_distance_to_node(position: Vector2, node_position: Vector2) -> float:
	print(position.distance_to(node_position))
	return position.distance_to(node_position)

func is_resource_node_in_range(position: Vector2, resource_type: String) -> bool:
	resource_node_keys = resource_nodes.keys()
	for key in resource_node_keys:
		if (str(resource_nodes[key]) == resource_type):
			if (abs(position.distance_to(Vector2(resource_node_keys[resource_node_keys.find(key)]))) <= NODE_RANGE):
				print("Distance from: " + str(key) + " " + str(position.distance_to(Vector2(resource_node_keys[resource_node_keys.find(key)]))))
				return true
			else:
				print("Distance from: " + str(key) + " " + str(position.distance_to(Vector2(resource_node_keys[resource_node_keys.find(key)]))))
	return false
