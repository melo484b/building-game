extends CanvasLayer

# Children
onready var cursor_sprite: Sprite = $CursorSprite
onready var selection_sprite: Sprite = $SelectionSprite

# Building sprites
onready var well_sprite: StreamTexture = preload("res://Sprites/well.png")
onready var hunter_sprite: StreamTexture = preload("res://Sprites/huntingShanty.png")
onready var fisher_sprite: StreamTexture = preload("res://Sprites/fishingboat.png")
onready var house_sprite: StreamTexture = preload("res://Sprites/house.png")
onready var woodchop_sprite: StreamTexture = preload("res://Sprites/woodchop.png")
onready var mine_sprite: StreamTexture = preload("res://Sprites/mine.png")
onready var blacksmith_sprite: StreamTexture = preload("res://Sprites/blacksmith.png")
onready var shop_sprite: StreamTexture = preload("res://Sprites/shop.png")

# InputController
onready var input: Node = get_parent().get_node("InputController")

# Original cursor
onready var original_cursor_sprite: StreamTexture = preload("res://Sprites/cursor.png")
var sprite_array: Array = []

# Keep track of current sprite
var current_sprite: StreamTexture = null

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	sprite_array = [well_sprite, hunter_sprite, fisher_sprite, house_sprite, woodchop_sprite, mine_sprite, blacksmith_sprite, shop_sprite, original_cursor_sprite]

func _process(_delta):
	if (input.grid_snap):
		selection_sprite.visible = true
		cursor_sprite.global_position = input.hud.grid_snap()
		selection_sprite.global_position = input.hud.grid_snap()
	else:
		cursor_sprite.global_position = cursor_sprite.get_global_mouse_position()

func set_cursor_texture(index) -> void:
	if (sprite_array[index] != null):
		cursor_sprite.set_texture(sprite_array[index])
	else:
		print("No valid cursor at that index")

func reset_cursor() -> void:
	set_cursor_texture(8)
	selection_sprite.visible = false
	
