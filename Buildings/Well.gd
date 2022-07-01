extends Building
class_name Well

func add_to_player_resources():
	var current_water = PlayerResources.get_water()
	PlayerResources.set_water(current_water + 1)
