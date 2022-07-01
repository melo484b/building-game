extends Building
class_name Blacksmith

func add_to_player_resources():
	var current_metal = PlayerResources.get_metal()
	PlayerResources.set_metal(current_metal + 1)
