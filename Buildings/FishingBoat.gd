extends Building
class_name FishingBoat

func add_to_player_resources():
	var current_food = PlayerResources.get_food()
	PlayerResources.set_food(current_food + 1)
