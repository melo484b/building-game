extends Button

signal open_shop

func _on_Area2D_mouse_entered():
	self.visible = true


func _on_Area2D_mouse_exited():
	self.visible = false


func _on_Button_button_down():
	emit_signal("open_shop")
