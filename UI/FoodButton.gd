extends ShopButton

func _ready():
	resource = FOOD
	label = $"../FoodLabel"

func _on_FoodButton_button_down():
	make_transaction(resource)
