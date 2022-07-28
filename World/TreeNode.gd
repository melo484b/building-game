extends Node2D

onready var sprite: Sprite = $Sprite

func _ready():
	sprite.frame = rand_range(0, 3)

func activate_transparency() -> void:
	sprite.modulate = Color(1, 1, 1, 0.70)
	
