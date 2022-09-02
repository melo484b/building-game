extends CanvasLayer

onready var play: Button = $MarginContainer/PanelContainer/MarginContainer/VBoxContainer/PlayButton
onready var options: Button = $MarginContainer/PanelContainer/MarginContainer/VBoxContainer/OptionsButton
onready var quit: Button = $MarginContainer/PanelContainer/MarginContainer/VBoxContainer/QuitButton

func _ready():
	play.connect("pressed", self, "_on_play_button")
	options.connect("pressed", self, "_on_options_button")
	quit.connect("pressed", self, "_on_quit_button")

func _on_play_button() -> void:
	get_tree().change_scene("res://Game/Game.tscn")
func _on_options_button() -> void:
	pass
func _on_quit_button() -> void:
	get_tree().quit()
