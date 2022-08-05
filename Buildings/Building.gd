extends Node
class_name Building

var timer: Timer

# Resource that will be added to the PlayerResources
var resource = null

# Compatible tiles are as follows:
# 12 - grass
# 14 - sand
# 27 - water

# Enum to hold resource types
enum {
	WATER,
	FOOD,
	WOOD,
	STONE,
	METAL,
	GOLD,
	RESIDENTS,
	TOOLS	
	}

func _init():
	timer = Timer.new()
	add_child(timer)
	timer.autostart = true
	timer.wait_time = 1
	timer.connect("timeout", self, "on_timeout")

func _ready():
	print("Building ready at: " + str(self.position))
	
func on_timeout():
	modify_resources(resource)
	timer.start()

# Call the appropriate function based on the resource type passed
func modify_resources(resource_type) -> void:
	match resource_type:
		WATER:
			gather_resource("water")
		FOOD:
			gather_resource("food")
		WOOD:
			gather_resource("wood")
		STONE:
			gather_resource("stone")
		METAL:
			make_metal()
		GOLD:
			gather_resource("gold")
		RESIDENTS:
			consume_resources()
		_:
			print("Resource not set.")

func gather_resource(resource: String) -> void:
	PlayerResources.add_resource(resource, 1)

func make_metal() -> void:
	var metal_made = int(rand_range(1, 3));
	var stone_used = metal_made * 2;
	if (PlayerResources.get_resource("stone") >= stone_used):
		PlayerResources.add_resource("metal", metal_made)
		PlayerResources.remove_resource("stone", stone_used)
	else:
		print("Not enough stone.")

func consume_resources() -> void:
	pass

# Used by children to compare compatible tiles to tiles returned by main's get_current_tile()
func check_tile(tile_index, array_to_check) -> bool:
	return tile_index in array_to_check

# Clear remove position from array in WorldBuildings singleton then call queue_free()
func destroy_building() -> void:
	WorldBuildings.remove_building_location(self.position)
	self.queue_free()
