extends Node

var recipe_book = {
	"well": {"stone": 10},
	"hunter_shanty": {"water": 2, "food": 2, "wood": 10},
	"fishingboat": {"wood": 10},
	"house": {"water": 4, "food": 4, "wood": 10, "stone": 10},
	"woodchop": {"water": 2, "food": 2},
	"mine": {"water": 2, "food": 2},
	"blacksmith": {"wood": 10, "stone": 10},
	"shop": {"wood": 10, "stone": 10}
}

func compare_requirements(recipe_name):
	var key_count = 0
	var positives = 0
	for key in recipe_book[recipe_name].keys():
		key_count += 1
		if (PlayerResources.get_resource_by_name(key) >= recipe_book[recipe_name][key]):
			positives += 1
	print("result: " + str(positives) + " / " + str(key_count))
	if (positives == key_count):
		return true

func get_ingredient_amount(recipe_name, ingredient_name):
	return recipe_book[recipe_name][ingredient_name]

func use_recipe_ingredients(recipe_name):
	for ingredient in recipe_book[recipe_name].keys():
		PlayerResources.set_resource_by_name(ingredient, PlayerResources.get_resource_by_name(ingredient) - get_ingredient_amount(recipe_name, ingredient))
