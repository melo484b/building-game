extends Node2D

onready var sprite: Sprite = $Sprite
onready var area: Area2D = $Area2D

func _ready():
	sprite.frame = rand_range(0, 3)

func activate_transparency() -> void:
	sprite.modulate = Color(1, 1, 1, 0.40)
	


func _on_Area2D_area_entered(area):
	activate_transparency()
