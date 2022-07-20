extends Building
class_name Blacksmith

var recipe = "blacksmith"

var compatible_tiles = [12, 14]

# Override Building timer
func _init():
	timer.wait_time = 3

func _ready():
	resource = METAL
