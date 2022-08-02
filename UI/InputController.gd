extends Node

# Relevant node access
onready var buttons: Panel = get_parent().get_node("ButtonPanel")
onready var resources: Panel = get_parent().get_node("ResourcesPanel")
onready var cursor: Node = get_parent().get_node("MouseCursor")
onready var hud: Control = get_parent()
onready var recipes: Node = get_parent().get_node("BuildingRecipes")
onready var dev: Panel = get_parent().get_node("DevPanel")

var is_building: bool = false

var grid_snap: bool = false

func _ready():
	pass

# Get player input
func _input(_event):
	if (Input.is_action_just_pressed("hide_buttons")):
		if (!buttons.get_visibility() && !is_building):
			buttons.set_visibility(true)
		else:
			buttons.set_visibility(false)
		
	if (Input.is_action_just_pressed("hide_resources")):
		if (!resources.get_visibility() && !is_building):
			resources.set_visibility(true)
		else:
			resources.set_visibility(false)
	
	if (Input.is_action_just_pressed("ui_cancel") || Input.is_action_just_pressed("r_click")):
		end_building()
	
	if (Input.is_action_just_pressed("l_click")):
		place_building(hud.main.selected_building)
	
	if (Input.is_action_just_pressed("dev_mode")):
		if (dev.get_visibility()):
			dev.hide()
		else:
			dev.reveal()
		

# Checks if the player has selected a building
# Checks if player has enough resources to construct the building
# Checks if player is holding the place-multiple button before ending building
func place_building(building) -> void:
	if (hud.main.selected_building != null):
		var building_instance = hud.main.selected_building.instance()
		if (building_instance.check_tile(hud.main.get_current_tile(), building_instance.compatible_tiles) and WorldBuildings.is_location_empty(hud.grid_snap())):
			if (recipes.compare_requirements(building_instance.recipe)):
				building_instance.position = hud.grid_snap()
				get_parent().get_parent().get_node("WorldMap").add_child(building_instance)
				WorldBuildings.add_building_location(hud.grid_snap())
				hud.main.world.check_locations(building_instance.position.y)
				recipes.use_recipe_ingredients(building_instance.recipe)
				if (Input.is_action_pressed("place_multiple")):
					pass
				else:
					end_building()
			else:
				hud.notEnoughResources()
				end_building()
		else:
			hud.invalidPlacement()

func is_building_selected() -> bool:
	return !hud.main.selected_building == null

func set_selected_building(building) -> void:
	hud.main.selected_building = building

# Make the mouse move on a grid
func _on_HUD_is_building() -> void:
	buttons.set_visibility(false)
	is_building = true
	grid_snap = true

func end_building() -> void:
	hud.main.selected_building = null
	cursor.reset_cursor()
	is_building = false
	grid_snap = false
	buttons.set_visibility(true)
