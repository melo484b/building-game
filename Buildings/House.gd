extends Building
class_name House

signal starving

var recipe: String = "house"

var residents: int = 4

var compatible_tiles: Array = [12, 14]

onready var resident_label: Label = $ResidentCount/ResidentLabel
onready var resident_control: Control = $ResidentCount

func _ready():
	resource = RESIDENTS

# Override
func consume_resources() -> void:
	var current_water = PlayerResources.get_resource("water")
	var current_food = PlayerResources.get_resource("food")
	if (current_water > 4 && current_food > 4):
		if (residents < 4):
			residents += 1
		PlayerResources.remove_resource("water", residents)
		PlayerResources.remove_resource("food", residents)
	if (residents == 0):
		queue_free()
	if (current_water < 4 || current_food < 4):
		residents -= 1
		emit_signal("starving")
		print("starving")
	update_residentLabel()

func update_residentLabel() -> void:
	resident_label.text = str(residents)
	resident_control.hint_tooltip = (str(residents) + " Residents")

func get_compatible_tiles() -> Array:
	return compatible_tiles
