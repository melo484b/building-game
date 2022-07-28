extends Building
class_name Blacksmith

var recipe: String = "blacksmith"

var compatible_tiles: Array = [12, 14]

# Override Building timer
func _init():
	timer.wait_time = 3

func _ready():
	resource = METAL

func _on_MetalButton_button_down():
	pass # Produce metal

func _on_ToolsButton_button_down():
	pass # Produce tools
