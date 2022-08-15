extends Building
class_name Shop

signal shop_built

var recipe: String = "shop"

var compatible_tiles: Array = [12, 14]

func _ready():
	resource = GOLD
	# Each shop building will increase the player's gold by 1 every 5 seconds
	timer.wait_time = 5
	emit_signal("shop_built")
	
