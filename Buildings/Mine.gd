extends Building
class_name Mine

var recipe: String = "mine"

var compatible_tiles: Array = [14]

# Override Building timer
func _init():
	timer.wait_time = 3

func _ready():
	resource = STONE
