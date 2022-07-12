extends Node
class_name Building

var timer

# Resource that will be added to the PlayerResources
var resource = null

# Enum to hold resource types
enum {
	WATER,
	FOOD,
	WOOD,
	STONE,
	METAL,
	GOLD,
	RESIDENTS	
	}

var resources_satisfied = true

# Resource requirements dictionary to override in children
var resource_requirements = {}

var resource_keys

func _init():
	timer = Timer.new()
	add_child(timer)
	timer.autostart = true
	timer.wait_time = 1
	timer.connect("timeout", self, "on_timeout")

func _ready():
	print("Building ready")
	
func on_timeout():
	modify_resources(resource)
	timer.start()

# Call the appropriate function based on the resource type passed
func modify_resources(resource_type):
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
			
func gather_water():
	var current_water = PlayerResources.get_water()
	PlayerResources.set_water(current_water + 1)

func gather_food():
	var current_food = PlayerResources.get_food()
	PlayerResources.set_food(current_food + 1)

func gather_wood():
	var current_wood = PlayerResources.get_wood()
	PlayerResources.set_wood(current_wood + 1)

func gather_stone():
	var current_stone = PlayerResources.get_stone()
	PlayerResources.set_stone(current_stone + 1)

func make_metal():
	var current_metal = PlayerResources.get_metal()
	var current_stone = PlayerResources.get_stone()
	var metal_made = int(rand_range(1, 3));
	var stone_used = metal_made * 2;
	if (PlayerResources.get_stone() >= stone_used):
		PlayerResources.set_metal(current_metal + metal_made)
		PlayerResources.set_stone(current_stone - stone_used)
	else:
		print("Not enough stone.")

func collect_taxes():
	var current_gold = PlayerResources.get_gold()
	PlayerResources.set_gold(current_gold + 1)

func consume_resources():
	pass

# Return true if the PlayerResources contain enough materials
func check_for_required_materials():
	for resource in resource_keys:
		pass
