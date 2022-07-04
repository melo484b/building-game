extends VBoxContainer

# Labels
onready var water = $WaterLabel
onready var food = $FoodLabel
onready var wood = $WoodLabel
onready var stone = $StoneLabel
onready var metal = $MetalLabel
onready var gold = $GoldLabel 

func _ready():
	self.connect("label_update", self, "on_label_update")

func on_label_update():
	water.text = str(PlayerResources.get_water())
	food.text = str(PlayerResources.get_food())
	wood.text = str(PlayerResources.get_wood())
	stone.text = str(PlayerResources.get_stone())
	metal.text = str(PlayerResources.get_metal())
	gold.text = str(PlayerResources.get_gold())
