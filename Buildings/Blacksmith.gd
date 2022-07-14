extends Building
class_name Blacksmith

var recipe = "blacksmith"

# Override Building timer
func _init():
	timer.wait_time = 3

func _ready():
	resource = METAL
