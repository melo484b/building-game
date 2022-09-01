extends ShopButton

func _ready():
	resource = WATER
	label = $"../WaterLabel"

func _on_WaterButton_button_down():
	make_transaction(resource)
