extends ShopButton

func _ready():
	resource = STONE
	label = $"../StoneLabel"

func _on_StoneButton_button_down():
	make_transaction(resource)
