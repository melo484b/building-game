extends Building
class_name Well

var recipe: String = "well"

var compatible_tiles: Array = [12]

func _ready():
	resource = WATER
