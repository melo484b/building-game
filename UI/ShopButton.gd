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

# if transaction_type is true then the shop is in buying mode
func make_transaction(resource_type, transaction_type: bool) -> void:
	match resource_type:
		WATER:
			exchange_resource("water", transaction_type)
		FOOD:
			exchange_resource("food", transaction_type)
		WOOD:
			exchange_resource("wood", transaction_type)
		STONE:
			exchange_resource("stone", transaction_type)
		METAL:
			exchange_resource("metal", transaction_type)
		GOLD:
			exchange_resource("gold", transaction_type)
		_:
			print("Resource not set.")

# TODO present the player with a pop-up if they are not able to make a purchase
func exchange_resource(resource: String, transaction_type: bool) -> void:
	if (transaction_type):
		if (PlayerResources.get_resource("gold") > 10):
			PlayerResources.add_resource(resource, 10)
			PlayerResources.remove_resource("gold", label.text.to_int())
		else:
			print("Unable to complete the transaction")
	elif (!transaction_type):
		if (PlayerResources.get_resource(resource) > 10):
			PlayerResources.remove_resource(resource, 10)
			PlayerResources.add_resource("gold", label.text.to_int())
		else:
			print("Unable to complete the transaction")
