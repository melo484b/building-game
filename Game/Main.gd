extends Node2D

onready var timer = $TickTimer
onready var hud = $HUD
onready var world = $WorldMap

# Preloaded buildings
onready var house: PackedScene = preload("res://Buildings/House.tscn")
onready var mine: PackedScene = preload("res://Buildings/Mine.tscn")
onready var blacksmith: PackedScene = preload("res://Buildings/Blacksmith.tscn")
onready var fishingboat: PackedScene = preload("res://Buildings/FishingBoat.tscn")
onready var well: PackedScene = preload("res://Buildings/Well.tscn")
onready var shop: PackedScene = preload("res://Buildings/Shop.tscn")
onready var woodchop: PackedScene = preload("res://Buildings/Woodchop.tscn")
onready var hunter_shanty: PackedScene = preload("res://Buildings/HunterShanty.tscn")

# Building the player has selected from the button bar
var selected_building: PackedScene = null

# Tile the cursor is positioned over
var current_tile: int = -1

func _ready():
	hud.update_labels()

func _on_TickTimer_timeout() -> void:
	hud.update_labels()

func get_current_tile() -> int:
	self.current_tile = world.get_cellv(world.world_to_map(get_global_mouse_position()))
	return self.current_tile

