extends Panel

func hide() -> void:
	self.visible = false

func reveal() -> void:
	self.visible = true

func get_visibility() -> bool:
	return self.visible


func _on_MaxResourcesButton_button_down():
	PlayerResources.resources_available = {
	"water": 999,
	"food": 999,
	"wood": 999,
	"stone": 999,
	"metal": 999,
	"gold": 999
	}

func _on_LimitResourcesButton_button_down():
	PlayerResources.resources_available = {
	"water": 50,
	"food": 50,
	"wood": 50,
	"stone": 50,
	"metal": 0,
	"gold": 0
	}
