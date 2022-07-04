extends Node2D

# Player gathers resources after X amount of ticks
onready var timer = $TickTimer
onready var hud = $HUD

func _on_TickTimer_timeout():
	hud.update_labels()
