extends Node2D

onready var sprite = $Sprite

func _ready():
	sprite.frame = rand_range(0, 3)

