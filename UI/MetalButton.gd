extends ShopButton

func _ready():
	resource = METAL
	label = $"../MetalLabel"

func _on_MetalButton_button_down():
	make_transaction(resource)
