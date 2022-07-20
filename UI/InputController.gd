extends Node

# Relevant node access
onready var buttons = get_parent().get_node("ButtonPanel")
onready var resources = get_parent().get_node("ResourcesPanel")
onready var cursor = get_parent().get_node("MouseCursor")
onready var hud = get_parent()
onready var recipes = get_parent().get_node("BuildingRecipes")

var building = false

var grid_snap = false

func _ready():
	pass

# Get player input
func _input(event):
	if (Input.is_action_just_pressed("hide_buttons")):
		if (!buttons.get_visibility() && !building):
			buttons.set_visibility(true)
		else:
			buttons.set_visibility(false)
		
	if (Input.is_action_just_pressed("hide_resources")):
		if (!resources.get_visibility() && !building):
			resources.set_visibility(true)
		else:
			resources.set_visibility(false)
	
	if (Input.is_action_just_pressed("ui_cancel") || Input.is_action_just_pressed("r_click")):
		end_building()
	
	if (Input.is_action_just_pressed("l_click")):
		place_building(hud.main.selected_building)

# Checks if the player has selected a building
# Checks if player has enough resources to construct the building
# Checks if player is holding the place-multiple button before ending building
func place_building(building):
	if (hud.main.selected_building != null):
		var building_instance = hud.main.selected_building.instance()
		if (building_instance.check_tile(hud.main.get_current_tile(), building_instance.compatible_tiles)):
			if (recipes.compare_requirements(building_instance.recipe)):
				building_instance.position = hud.grid_snap()
				get_parent().get_parent().add_child(building_instance)
				recipes.use_recipe_ingredients(building_instance.recipe)
				if (Input.is_action_pressed("place_multiple")):
					pass
				else:
					end_building()
			else:
				print("Not enough materials.")
				end_building()
		else:
			print("Invalid placement")

func is_building_selected():
	return !hud.main.selected_building == null

func set_selected_building(building):
	hud.main.selected_building = building

# Make the mouse move on a grid
func _on_HUD_is_building():
	buttons.set_visibility(false)
	building = true
	grid_snap = true

func end_building():
	hud.main.selected_building = null
	cursor.reset_cursor()
	building = false
	grid_snap = false
	buttons.set_visibility(true)
