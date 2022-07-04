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
	GOLD	
	}

func _init():
	timer = Timer.new()
	add_child(timer)
	timer.autostart = true
	timer.wait_time = 1
	timer.connect("timeout", self, "on_timeout")

func _ready():
	print("Building ready")
	
func on_timeout():
	print("Timer done, adding resource: " + str(resource))
	increase_resource(resource)
	timer.start()

# Increase PlayerResources by an amount. For some resource, others will be decreased. 
# Gold will be acquired via markets.
func increase_resource(resource_type):
	match resource_type:
		WATER:
			var current_water = PlayerResources.get_water()
			PlayerResources.set_water(current_water + 1)
		FOOD:
			var current_food = PlayerResources.get_food()
			PlayerResources.set_food(current_food + 1)
		WOOD:
			var current_wood = PlayerResources.get_wood()
			PlayerResources.set_wood(current_wood + 1)
		STONE:
			var current_stone = PlayerResources.get_stone()
			PlayerResources.set_stone(current_stone + 1)
		METAL:
			var current_metal = PlayerResources.get_metal()
			PlayerResources.set_metal(current_metal + 1)
		_:
			print("Resource not set.")
			
