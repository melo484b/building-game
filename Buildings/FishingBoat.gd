extends Building
class_name FishingBoat

var recipe: String = "fishingboat"

# Set the amount of fish available in the area to an amount between 20 & 50
var fish_in_the_sea: int = int(rand_range(20, 50))

var compatible_tiles: Array = [27]

func _ready():
	resource = FOOD

# Override
func gather_resource(resource: String) -> void:
	if (fish_in_the_sea > 0):
		if (fish_in_the_sea > 35):
			PlayerResources.add_resource(resource, 1)
		else:
			PlayerResources.add_resource(resource, 2)
		fish_in_the_sea -= 1
		print(str(fish_in_the_sea))
		update_fish_count()
	else:
		destroy_building()

func update_fish_count() -> void:
	$FishCount.hint_tooltip = ("Fish count: " + str(fish_in_the_sea))
