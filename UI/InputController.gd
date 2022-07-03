extends Node

onready var buttons = get_parent().get_node("ButtonPanel")
onready var resources = get_parent().get_node("ResourcesPanel")
onready var cursor = get_parent().get_node("MouseCursor")

# Building the player has selected from the button bar
var selected_building = null

func _ready():
	pass

# Get player input
func _input(event):
	if (Input.is_action_just_pressed("hide_buttons")):
		if (!buttons.get_visibility()):
			buttons.set_visibility(true)
		else:
			buttons.set_visibility(false)
		
	if (Input.is_action_just_pressed("hide_resources")):
		if (!resources.get_visibility()):
			resources.set_visibility(true)
		else:
			resources.set_visibility(false)
	
	if (Input.is_action_just_pressed("ui_cancel")):
		selected_building = null
	
	if (Input.is_action_just_pressed("l_click")):
		place_building(selected_building)

# TODO Make this talk to the TileMap for grid-placement
# TODO Check that button panel is not located below before placement
func place_building(building):
	if (selected_building != null):
		var building_instance = selected_building.instance()
		building_instance.position = get_viewport().get_mouse_position()
		get_parent().add_child(building_instance)
		# Add control to allow multiple placements of the same scene
		selected_building = null
		cursor.reset_cursor()

func is_building_selected():
	return !selected_building == null

func set_selected_building(building):
	selected_building = building

