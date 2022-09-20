extends Building
class_name Woodchop

var recipe: String = "woodchop"

var compatible_tiles: Array = [12]

# Override Building timer
func _init():
	timer.wait_time = 2
	node_required = "wood"

func _ready():
	resource = WOOD

# TODO: Check that the building is placed near a tree node
