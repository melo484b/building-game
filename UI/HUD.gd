extends Control

signal is_building

# Main scene
onready var main = get_parent()

# Panels - to allow hiding
onready var buttons = $ButtonPanel
onready var resources = $ResourcesPanel
onready var input_controller = $InputController

# Button variables
onready var well_button = $ButtonPanel/HBoxContainer/WellButton
onready var hunter_button = $ButtonPanel/HBoxContainer/HunterButton
onready var fisher_button = $ButtonPanel/HBoxContainer/FisherButton
onready var house_button = $ButtonPanel/HBoxContainer/HouseButton
onready var wood_button = $ButtonPanel/HBoxContainer/WoodchopButton
onready var mine_button = $ButtonPanel/HBoxContainer/MineButton
onready var blacksmith_button = $ButtonPanel/HBoxContainer/BlacksmithButton
onready var shop_button = $ButtonPanel/HBoxContainer/ShopButton

# Player resources
onready var player_resources = $PlayerResources

# Label variables
onready var water_label = $ResourcesPanel/HBoxContainer/AmountLabels/WaterLabel
onready var food_label = $ResourcesPanel/HBoxContainer/AmountLabels/FoodLabel
onready var wood_label = $ResourcesPanel/HBoxContainer/AmountLabels/WoodLabel
onready var stone_label = $ResourcesPanel/HBoxContainer/AmountLabels/StoneLabel
onready var metal_label = $ResourcesPanel/HBoxContainer/AmountLabels/MetalLabel
onready var gold_label = $ResourcesPanel/HBoxContainer/AmountLabels/GoldLabel

# Mouse cursor
onready var cursor = $MouseCursor

func _on_WellButton_button_down():
	emit_signal("is_building")
	input_controller.set_selected_building(main.well)
	cursor.set_cursor_texture(0)

func _on_HunterButton_button_down():
	emit_signal("is_building")
	input_controller.set_selected_building(main.hunter_shanty)
	cursor.set_cursor_texture(1)

func _on_FisherButton_button_down():
	emit_signal("is_building")
	input_controller.set_selected_building(main.fishingboat)
	cursor.set_cursor_texture(2)

func _on_HouseButton_button_down():
	emit_signal("is_building")
	input_controller.set_selected_building(main.house)
	cursor.set_cursor_texture(3)

func _on_WoodButton_button_down():
	emit_signal("is_building")
	input_controller.set_selected_building(main.woodchop)
	cursor.set_cursor_texture(4)

func _on_MineButton_button_down():
	emit_signal("is_building")
	input_controller.set_selected_building(main.mine)
	cursor.set_cursor_texture(5)

func _on_BlacksmithButton_button_down():
	emit_signal("is_building")
	input_controller.set_selected_building(main.blacksmith)
	cursor.set_cursor_texture(6)

func _on_ShopButton_button_down():
	emit_signal("is_building")
	input_controller.set_selected_building(main.shop)
	cursor.set_cursor_texture(7)

func update_labels():
	water_label.text = str(PlayerResources.get_water())
	food_label.text = str(PlayerResources.get_food())
	wood_label.text = str(PlayerResources.get_wood())
	stone_label.text = str(PlayerResources.get_stone())
	metal_label.text = str(PlayerResources.get_metal())
	gold_label.text = str(PlayerResources.get_gold())
