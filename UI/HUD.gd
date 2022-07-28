extends Control

signal is_building

# Main scene
onready var main: Node2D = get_parent()

# Panels - to allow hiding
onready var buttons: Panel = $ButtonPanel
onready var resources: Panel = $ResourcesPanel
onready var input_controller: Node = $InputController

# Button variables
onready var well_button: Button = $ButtonPanel/HBoxContainer/WellButton
onready var hunter_button: Button = $ButtonPanel/HBoxContainer/HunterButton
onready var fisher_button: Button = $ButtonPanel/HBoxContainer/FisherButton
onready var house_button: Button = $ButtonPanel/HBoxContainer/HouseButton
onready var wood_button: Button = $ButtonPanel/HBoxContainer/WoodchopButton
onready var mine_button: Button = $ButtonPanel/HBoxContainer/MineButton
onready var blacksmith_button: Button = $ButtonPanel/HBoxContainer/BlacksmithButton
onready var shop_button: Button = $ButtonPanel/HBoxContainer/ShopButton

# Player resources
onready var player_resources: Node = $PlayerResources

# Label variables
onready var water_label: Label = $ResourcesPanel/HBoxContainer/AmountLabels/WaterLabel
onready var food_label: Label = $ResourcesPanel/HBoxContainer/AmountLabels/FoodLabel
onready var wood_label: Label = $ResourcesPanel/HBoxContainer/AmountLabels/WoodLabel
onready var stone_label: Label = $ResourcesPanel/HBoxContainer/AmountLabels/StoneLabel
onready var metal_label: Label = $ResourcesPanel/HBoxContainer/AmountLabels/MetalLabel
onready var gold_label: Label = $ResourcesPanel/HBoxContainer/AmountLabels/GoldLabel

# Mouse cursor
onready var cursor: CanvasLayer = $MouseCursor

func _on_WellButton_button_down() -> void:
	emit_signal("is_building")
	input_controller.set_selected_building(main.well)
	cursor.set_cursor_texture(0)

func _on_HunterButton_button_down() -> void:
	emit_signal("is_building")
	input_controller.set_selected_building(main.hunter_shanty)
	cursor.set_cursor_texture(1)

func _on_FisherButton_button_down() -> void:
	emit_signal("is_building")
	input_controller.set_selected_building(main.fishingboat)
	cursor.set_cursor_texture(2)

func _on_HouseButton_button_down() -> void:
	emit_signal("is_building")
	input_controller.set_selected_building(main.house)
	cursor.set_cursor_texture(3)

func _on_WoodButton_button_down() -> void:
	emit_signal("is_building")
	input_controller.set_selected_building(main.woodchop)
	cursor.set_cursor_texture(4)

func _on_MineButton_button_down() -> void:
	emit_signal("is_building")
	input_controller.set_selected_building(main.mine)
	cursor.set_cursor_texture(5)

func _on_BlacksmithButton_button_down() -> void:
	emit_signal("is_building")
	input_controller.set_selected_building(main.blacksmith)
	cursor.set_cursor_texture(6)

func _on_ShopButton_button_down() -> void:
	emit_signal("is_building")
	input_controller.set_selected_building(main.shop)
	cursor.set_cursor_texture(7)

func update_labels() -> void:
	water_label.text = str(PlayerResources.get_water())
	food_label.text = str(PlayerResources.get_food())
	wood_label.text = str(PlayerResources.get_wood())
	stone_label.text = str(PlayerResources.get_stone())
	metal_label.text = str(PlayerResources.get_metal())
	gold_label.text = str(PlayerResources.get_gold())

func grid_snap() -> Vector2:
	var mouse_pos: Vector2 = main.world.world_to_map(get_global_mouse_position())
	return main.world.map_to_world(mouse_pos) + Vector2(8, 8)

func notEnoughResources() -> void:
	$ResourcesPopup.visible = true

func invalidPlacement() -> void:
	$PlacementPopup.visible = true

func _on_ResourcesPopup_visibility_changed() -> void:
	$ResourcesPopup.start_timer()

func _on_PlacementPopup_visibility_changed() -> void:
	$PlacementPopup.start_timer()

func _on_DestroyAllButton_button_down():
	main.world.destroy_all_buildings()
