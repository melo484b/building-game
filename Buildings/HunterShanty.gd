extends Building
class_name HunterShanty

var recipe = "hunter_shanty"

# Override Building timer
func _init():
	timer.wait_time = 2

func _ready():
	resource = FOOD
