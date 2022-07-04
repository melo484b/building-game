extends Control
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

# Preloaded buildings
onready var house = preload("res://Buildings/House.tscn")
onready var mine = preload("res://Buildings/Mine.tscn")
onready var blacksmith = preload("res://Buildings/Blacksmith.tscn")
onready var fishingboat = preload("res://Buildings/FishingBoat.tscn")
onready var well = preload("res://Buildings/Well.tscn")
onready var shop = preload("res://Buildings/Shop.tscn")
onready var woodchop = preload("res://Buildings/Woodchop.tscn")
onready var hunter_shanty = preload("res://Buildings/HunterShanty.tscn")

# Mouse cursor
onready var cursor = $MouseCursor

func _on_WellButton_button_down():
	input_controller.set_selected_building(well)
	cursor.set_cursor_texture(0)

func _on_HunterButton_button_down():
	input_controller.set_selected_building(hunter_shanty)
	cursor.set_cursor_texture(1)

func _on_FisherButton_button_down():
	input_controller.set_selected_building(fishingboat)
	cursor.set_cursor_texture(2)

func _on_HouseButton_button_down():
	input_controller.set_selected_building(house)
	cursor.set_cursor_texture(3)

func _on_WoodButton_button_down():
	input_controller.set_selected_building(woodchop)
	cursor.set_cursor_texture(4)

func _on_MineButton_button_down():
	input_controller.set_selected_building(mine)
	cursor.set_cursor_texture(5)

func _on_BlacksmithButton_button_down():
	input_controller.set_selected_building(blacksmith)
	cursor.set_cursor_texture(6)

func _on_ShopButton_button_down():
	input_controller.set_selected_building(shop)
	cursor.set_cursor_texture(7)

func update_labels():
	water_label.text = str(PlayerResources.get_water())
	food_label.text = str(PlayerResources.get_food())
	wood_label.text = str(PlayerResources.get_wood())
	stone_label.text = str(PlayerResources.get_stone())
	metal_label.text = str(PlayerResources.get_metal())
	gold_label.text = str(PlayerResources.get_gold())
