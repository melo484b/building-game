extends Button
class_name ShopButton

# The related Label - set on _ready() in the child class
onready var label: Label

# Resource that will be purchased/sold
var resource = null

# Enum to hold resource types - set on _ready() in the child class
enum {
	WATER,
	FOOD,
	WOOD,
	STONE,
	METAL,
	GOLD,
	TOOLS	
	}
# Sets the shop mode - default is buying
var buying: bool = true

func make_transaction(resource_type) -> void:
	match resource_type:
		WATER:
			exchange_resource("water")
		FOOD:
			exchange_resource("food")
		WOOD:
			exchange_resource("wood")
		STONE:
			exchange_resource("stone")
		METAL:
			exchange_resource("metal")
		GOLD:
			exchange_resource("gold")
		_:
			print("Resource not set.")

# TODO present the player with a pop-up if they are not able to make a purchase
func exchange_resource(resource: String) -> void:
	if (buying):
		if (PlayerResources.get_resource("gold") > 10):
			PlayerResources.add_resource(resource, 10)
			PlayerResources.remove_resource("gold", label.text.to_int())
		else:
			print("Unable to complete the transaction")
	elif (!buying):
		if (PlayerResources.get_resource(resource) > 10):
			PlayerResources.remove_resource(resource, 10)
			PlayerResources.add_resource("gold", label.text.to_int())
		else:
			print("Unable to complete the transaction")

# TODO move this to a more appropriate script
func toggle_shop_mode() -> void:
	if (buying):
		buying = false
	else:
		buying = true
