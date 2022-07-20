extends Building
class_name Well

var recipe = "well"

var compatible_tiles = [12]

func _ready():
	resource = WATER
