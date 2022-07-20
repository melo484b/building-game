extends Building
class_name HunterShanty

var recipe = "hunter_shanty"

var compatible_tiles = [12]

# Override Building timer
func _init():
	timer.wait_time = 2

func _ready():
	resource = FOOD
