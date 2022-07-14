extends Building
class_name Mine

var recipe = "mine"

# Override Building timer
func _init():
	timer.wait_time = 3

func _ready():
	resource = STONE
