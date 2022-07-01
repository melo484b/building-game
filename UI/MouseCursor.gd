extends CanvasLayer

# Children
onready var cursor_sprite = $CursorSprite

# Building sprites
onready var well_sprite = preload("res://Sprites/well.png")
onready var hunter_sprite = preload("res://Sprites/huntingShanty.png")
onready var fisher_sprite = preload("res://Sprites/fishingBoat.png")
onready var house_sprite = preload("res://Sprites/house.png")
onready var woodchop_sprite = preload("res://Sprites/woodchop.png")
onready var blacksmith_sprite = preload("res://Sprites/blacksmith.png")
onready var shop_sprite = preload("res://Sprites/shop.png")
# Original cursor
onready var original_cursor_sprite = preload("res://Sprites/cursor.png")
var sprite_array = []

# Keep track of current sprite
var current_sprite = null

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	sprite_array = [well_sprite, hunter_sprite, fisher_sprite, house_sprite, woodchop_sprite, blacksmith_sprite, shop_sprite, original_cursor_sprite]

func _process(delta):
	cursor_sprite.global_position = cursor_sprite.get_global_mouse_position()

func set_cursor_texture(index):
	if (sprite_array[index] != null):
		cursor_sprite.set_texture(sprite_array[index])
	else:
		print("No valid cursor at that index")

func reset_cursor():
	set_cursor_texture(7)
