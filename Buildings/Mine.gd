extends Building
class_name Mine

func add_to_player_resources():
	var current_stone = PlayerResources.get_stone()
	PlayerResources.set_stone(current_stone + 1)
