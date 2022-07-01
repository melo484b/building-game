extends Control
# Panels - to allow hiding
onready var buttons = $ButtonPanel
onready var resources = $ResourcesPanel

# Button variables
onready var well_button = $ButtonPanel/HBoxContainer/WellButton
onready var hunter_button = $ButtonPanel/HBoxContainer/HunterButton
onready var fisher_button = $ButtonPanel/HBoxContainer/FisherButton
onready var house_button = $ButtonPanel/HBoxContainer/HouseButton
onready var wood_button = $ButtonPanel/HBoxContainer/WoodButton
onready var mine_button = $ButtonPanel/HBoxContainer/MineButton
onready var blacksmith_button = $ButtonPanel/HBoxContainer/BlacksmithButton
onready var shop_button = $ButtonPanel/HBoxContainer/ShopButton

# Label variables
onready var water_label = $ResourcesPanel/HBoxContainer/AmountLabels/WaterLabel
onready var food_label = $ResourcesPanel/HBoxContainer/AmountLabels/FoodLabel
onready var wood_label = $ResourcesPanel/HBoxContainer/AmountLabels/WoodLabel
onready var stone_label = $ResourcesPanel/HBoxContainer/AmountLabels/StoneLabel
onready var metal_label = $ResourcesPanel/HBoxContainer/AmountLabels/MetalLabel
onready var gold_label = $ResourcesPanel/HBoxContainer/AmountLabels/GoldLabel

# Preloaded buildings
onready var house = preload("res://Buildings/House.tscn")
onready var mine = preload("res://Buildings/Mine.tscn")
onready var blacksmith = preload("res://Buildings/Blacksmith.tscn")
onready var fishingboat = preload("res://Buildings/FishingBoat.tscn")
onready var well = preload("res://Buildings/Well.tscn")
onready var shop = preload("res://Buildings/Shop.tscn")
onready var woodchop = preload("res://Buildings/Woodchop.tscn")
onready var hunter_shanty = preload("res://Buildings/HunterShanty.tscn")

# Building the player has selected from the button bar
var selected_item = null

# Get player input
func _input(event):
	if (Input.is_action_just_pressed("hide_buttons")):
		if (buttons.visible == false):
			buttons.visible = true
		else:
			buttons.visible = false
		
	if (Input.is_action_just_pressed("hide_resources")):
		if (resources.visible == false):
			resources.visible = true
		else:
			resources.visible = false
	
	if (Input.is_action_just_pressed("ui_cancel")):
		selected_item = null
	
	if (Input.is_action_just_pressed("l_click")):
		place_building(selected_item)

func _update():
	pass

# TODO Make this talk to the TileMap for grid-placement
# TODO Check that button panel is not located below before placement
func place_building(building):
	if (selected_item != null):
		var building_instance = selected_item.instance()
		building_instance.position = get_viewport().get_mouse_position()
		get_parent().add_child(building_instance)


func _on_WellButton_button_down():
	selected_item = well


func _on_HunterButton_button_down():
	selected_item = hunter_shanty


func _on_FisherButton_button_down():
	selected_item = fishingboat


func _on_HouseButton_button_down():
	selected_item = house


func _on_WoodButton_button_down():
	selected_item = woodchop


func _on_MineButton_button_down():
	selected_item = mine


func _on_BlacksmithButton_button_down():
	selected_item = blacksmith


func _on_ShopButton_button_down():
	selected_item = shop
