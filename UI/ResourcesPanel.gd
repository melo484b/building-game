extends Panel

func set_visibility(visibility_bool) -> void:
	self.visible = visibility_bool
	
func get_visibility() -> bool:
	return self.visible == true
