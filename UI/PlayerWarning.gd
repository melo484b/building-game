extends PopupPanel

func _on_Timer_timeout():
	self.visible = false

func start_timer() -> void:
	$Timer.start()
