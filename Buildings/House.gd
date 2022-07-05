extends Building
class_name House

signal starving

var residents = 4

func _ready():
	resource = null

func consume_resources():
	var current_water = PlayerResources.get_water()
	var current_food = PlayerResources.get_food()
	if (current_water > 4 && current_food > 4):
		if (residents < 4):
			residents += 1
		PlayerResources.set_water(current_water - residents)
		PlayerResources.set_food(current_food - residents)
	if (residents == 0):
		queue_free()
	if (current_water < 4 || current_food < 4):
		residents -= 1
		emit_signal("starving")
		print("starving")
