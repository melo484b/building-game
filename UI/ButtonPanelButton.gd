extends Button

func _ready():
	connect("mouse_entered", self, "_on_mouse_entered")
	connect("pressed", self, "_on_button_pressed")

func _on_mouse_entered() -> void:
	$"../../../SFXManager".hover.play()
func _on_button_pressed() -> void:
	$"../../../SFXManager".select.play()
