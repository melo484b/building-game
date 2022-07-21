extends Building
class_name FishingBoat

var recipe: String = "fishingboat"

# Set the amount of fish available in the area to an amount between 20 & 50
var fish_in_the_sea: int = int(rand_range(20, 50))

var compatible_tiles: Array = [27]

func _ready():
	resource = FOOD

# Override
func gather_food() -> void:
	if (fish_in_the_sea > 0):
		var current_food = PlayerResources.get_food()
		if (fish_in_the_sea > 35):
			PlayerResources.set_food(current_food + 1)
		else:
			PlayerResources.set_food(current_food + 2)
		fish_in_the_sea -= 1
	if (fish_in_the_sea <= 0):
		queue_free()
