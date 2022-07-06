extends Building
class_name Mine

# Override Building timer
func _init():
	timer.wait_time = 3

func _ready():
	resource = STONE
