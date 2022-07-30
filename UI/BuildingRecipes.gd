extends Node

var recipe_book: Dictionary = {
	"well": {"stone": 10},
	"hunter_shanty": {"water": 2, "food": 2, "wood": 10},
	"fishingboat": {"wood": 10},
	"house": {"water": 4, "food": 4, "wood": 10, "stone": 10},
	"woodchop": {"water": 2, "food": 2},
	"mine": {"water": 2, "food": 2},
	"blacksmith": {"wood": 10, "stone": 10},
	"shop": {"wood": 10, "stone": 10}
}

func compare_requirements(recipe_name) -> bool:
	var key_count = 0
	var positives = 0
	for key in recipe_book[recipe_name].keys():
		key_count += 1
		if (PlayerResources.get_resource(key) >= recipe_book[recipe_name][key]):
			positives += 1
	if (positives == key_count):
		return true
	else:
		return false

func get_ingredient_amount(recipe_name, ingredient_name) -> int:
	return recipe_book[recipe_name][ingredient_name]

func use_recipe_ingredients(recipe_name) -> void:
	for ingredient in recipe_book[recipe_name].keys():
		PlayerResources.remove_resource(ingredient, get_ingredient_amount(recipe_name, ingredient))

func recipe_tooltip(recipe_name) -> String:
	var tooltip_string = recipe_name + "\n\n"
	for ingredient in recipe_book[recipe_name]:
		tooltip_string += str(recipe_book[recipe_name][ingredient]) + " " + str(ingredient) + "\n\n"
	return tooltip_string
