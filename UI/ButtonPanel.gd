extends Panel

onready var recipes: Node = get_parent().get_node("BuildingRecipes")

func set_visibility(visibility_bool) -> void:
	self.visible = visibility_bool
	
func get_visibility() -> bool:
	return self.visible == true

func _ready():
	$HBoxContainer/WellButton.hint_tooltip = recipes.recipe_tooltip("well")
	$HBoxContainer/HunterButton.hint_tooltip = recipes.recipe_tooltip("hunter_shanty")
	$HBoxContainer/FisherButton.hint_tooltip = recipes.recipe_tooltip("fishingboat")
	$HBoxContainer/HouseButton.hint_tooltip = recipes.recipe_tooltip("house")
	$HBoxContainer/WoodchopButton.hint_tooltip = recipes.recipe_tooltip("woodchop")
	$HBoxContainer/MineButton.hint_tooltip = recipes.recipe_tooltip("mine")
	$HBoxContainer/BlacksmithButton.hint_tooltip = recipes.recipe_tooltip("blacksmith")
	$HBoxContainer/ShopButton.hint_tooltip = recipes.recipe_tooltip("shop")
