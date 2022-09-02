extends ColorRect

func _ready():
	rect_size.x = get_viewport().size.x
	rect_size.y = get_viewport().size.y
