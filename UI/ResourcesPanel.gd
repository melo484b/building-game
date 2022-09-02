extends Panel

onready var waterButton: Button = $"../ShopPanel/HBoxContainer/VBoxContainer/WaterButton"
onready var foodButton: Button = $"../ShopPanel/HBoxContainer/VBoxContainer2/FoodButton"
onready var woodButton: Button = $"../ShopPanel/HBoxContainer/VBoxContainer3/WoodButton"
onready var stoneButton: Button = $"../ShopPanel/HBoxContainer/VBoxContainer4/StoneButton"
onready var metalButton: Button = $"../ShopPanel/HBoxContainer/VBoxContainer5/MetalButton2"

func _ready():
	pass

var buying: bool = true

func set_visibility(visibility_bool) -> void:
	self.visible = visibility_bool
	
func get_visibility() -> bool:
	return self.visible == true

func reveal() -> void:
	self.visible = true

func hide() -> void:
	self.visible = false

func set_buying():
	if (buying):
		buying = false
	else:
		buying = true


func _on_WaterButton_button_down():
	waterButton.make_transaction(waterButton.resource, buying)


func _on_FoodButton_button_down():
	foodButton.make_transaction(foodButton.resource, buying)


func _on_WoodButton_button_down():
	woodButton.make_transaction(woodButton.resource, buying)


func _on_StoneButton_button_down():
	stoneButton.make_transaction(stoneButton.resource, buying)


func _on_MetalButton2_button_down():
	metalButton.make_transaction(metalButton.resource, buying)
