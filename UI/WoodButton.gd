extends ShopButton

func _ready():
	resource = WOOD
	label = $"../WoodLabel"

func _on_WoodButton_button_down():
	make_transaction(resource)
