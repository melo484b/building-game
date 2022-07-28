extends Node
class_name Building

var timer: Timer

# Resource that will be added to the PlayerResources
var resource: int = -1

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
			gather_water()
		FOOD:
			gather_food()
		WOOD:
			gather_wood()
		STONE:
			gather_stone()
		METAL:
			make_metal()
		GOLD:
			collect_taxes()
		RESIDENTS:
			consume_resources()
		_:
			print("Resource not set.")
			
func gather_water() -> void:
	var current_water = PlayerResources.get_water()
	PlayerResources.set_water(current_water + 1)

func gather_food() -> void:
	var current_food = PlayerResources.get_food()
	PlayerResources.set_food(current_food + 1)

func gather_wood() -> void:
	var current_wood = PlayerResources.get_wood()
	PlayerResources.set_wood(current_wood + 1)

func gather_stone() -> void:
	var current_stone = PlayerResources.get_stone()
	PlayerResources.set_stone(current_stone + 1)

func make_metal() -> void:
	var current_metal = PlayerResources.get_metal()
	var current_stone = PlayerResources.get_stone()
	var metal_made = int(rand_range(1, 3));
	var stone_used = metal_made * 2;
	if (PlayerResources.get_stone() >= stone_used):
		PlayerResources.set_metal(current_metal + metal_made)
		PlayerResources.set_stone(current_stone - stone_used)
	else:
		print("Not enough stone.")

func collect_taxes() -> void:
	var current_gold = PlayerResources.get_gold()
	PlayerResources.set_gold(current_gold + 1)

func consume_resources() -> void:
	pass

# Used by children to compare compatible tiles to tiles returned by main's get_current_tile()
func check_tile(tile_index, array_to_check) -> bool:
	return tile_index in array_to_check

func destroy_building() -> void:
	self.queue_free()
