extends Panel

func _ready():
	pass

func set_visibility(visibility_bool) -> void:
	self.visible = visibility_bool
	
func get_visibility() -> bool:
	return self.visible == true

func reveal() -> void:
	self.visible = true

func hide() -> void:
	self.visible = false
