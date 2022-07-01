extends Building
class_name Woodchop

func add_to_player_resources():
	var current_wood = PlayerResources.get_wood()
	PlayerResources.set_wood(current_wood + 1)
