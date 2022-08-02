extends TileMap

onready var tree1: Node2D = $TreeNode1
onready var tree2: Node2D = $TreeNode2
onready var tree3: Node2D = $TreeNode3
onready var tree4: Node2D = $TreeNode4
onready var tree5: Node2D = $TreeNode5
onready var tree6: Node2D = $TreeNode6
onready var tree7: Node2D = $TreeNode7

var trees = []

func _ready():
	var trees = [tree1.position.y, tree2.position.y, tree3.position.y, tree4.position.y,
	tree5.position.y, tree6.position.y, tree7.position.y]

func check_locations(y_position: int) -> void:
	if (trees != null):
		for tree in trees:
			if (y_position >= tree + 50):
				tree.activate_transparency()

func destroy_all_buildings() -> void:
	var destroy_us = get_tree().get_nodes_in_group("building")
	for i in destroy_us:
		i.destroy_building()


