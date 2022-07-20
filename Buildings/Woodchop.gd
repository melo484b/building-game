extends Building
class_name Woodchop

var recipe = "woodchop"

var compatible_tiles = [12]

# Override Building timer
func _init():
	timer.wait_time = 2

func _ready():
	resource = WOOD

# TODO: Override check_tile() to check that the building is placed near a tree node, 
# in addition to being placed on a grass tile
