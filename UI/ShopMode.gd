extends HBoxContainer

onready var buy: Button = $BuyButton
onready var sell: Button = $SellButton
onready var shop: Panel = $".."
onready var waterLabel: Label = $"../HBoxContainer/VBoxContainer/WaterLabel"
onready var foodLabel: Label = $"../HBoxContainer/VBoxContainer2/FoodLabel"
onready var woodLabel: Label = $"../HBoxContainer/VBoxContainer3/WoodLabel"
onready var stoneLabel: Label = $"../HBoxContainer/VBoxContainer4/StoneLabel"
onready var metalLabel: Label = $"../HBoxContainer/VBoxContainer5/MetalLabel"

var labelArray = []

func _ready():
	labelArray = [waterLabel, foodLabel, woodLabel, stoneLabel, metalLabel]

func _on_BuyButton_button_down() -> void:
	sell.pressed = false
	shop.set_buying()
	change_price(true)

func _on_SellButton_button_down() -> void:
	buy.pressed = false
	shop.set_buying()
	change_price(false)

func change_price(buying: bool) -> void:
	if (buying):
		for l in labelArray:
			l.text = str(int(l.text) * 2) + "g"
	else:
		for l in labelArray:
			l.text = str(int(l.text) / 2) + "g"
			
