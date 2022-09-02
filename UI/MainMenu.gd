extends CanvasLayer

onready var play: Button = $MarginContainer/PanelContainer/MarginContainer/VBoxContainer/PlayButton
onready var options: Button = $MarginContainer/PanelContainer/MarginContainer/VBoxContainer/OptionsButton
onready var quit: Button = $MarginContainer/PanelContainer/MarginContainer/VBoxContainer/QuitButton
onready var audio:AudioStreamPlayer = $AudioStreamPlayer
onready var animation_player: AnimationPlayer = $AnimationPlayer
onready var menu:PanelContainer = $MarginContainer/PanelContainer

func _ready():
	play.connect("pressed", self, "_on_play_button")
	options.connect("pressed", self, "_on_options_button")
	quit.connect("pressed", self, "_on_quit_button")

func _on_play_button() -> void:
	menu.visible = false
	animation_player.play("fade_out")
	
func _on_options_button() -> void:
	pass
func _on_quit_button() -> void:
	get_tree().quit()

func load_game() -> void:
	get_tree().change_scene("res://Game/Game.tscn")
