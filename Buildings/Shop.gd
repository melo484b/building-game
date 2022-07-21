extends Building
class_name Shop

# Use to open the shop menu in the HUD
signal shop_menu

var recipe: String = "shop"

var compatible_tiles: Array = [12, 14]

func _ready():
	resource = GOLD
	# Each shop build will increase the player's gold by 1 every 5 seconds
	timer.wait_time = 5

func _event(_event):
	# Check for location of click compared to the Sprite
	if (Input.event.is_action_just_pressed("l_click")):
		# emit_signal("shop_menu")
		pass
