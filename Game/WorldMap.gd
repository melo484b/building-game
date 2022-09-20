extends TileMap

onready var tree1: Node2D = $TreeNode1
onready var tree2: Node2D = $TreeNode2
onready var tree3: Node2D = $TreeNode3
onready var tree4: Node2D = $TreeNode4
onready var tree5: Node2D = $TreeNode5
onready var tree6: Node2D = $TreeNode6
onready var tree7: Node2D = $TreeNode7

var trees = []


func _ready() -> void:
	trees = [tree1, tree2, tree3, tree4,
	tree5, tree6, tree7]
	
func check_y_positions(y_position: int) -> void:
	if (trees != null):
		for tree in trees:
			if (y_position >= tree.position.y + 50):
				tree.activate_transparency()

func add_trees_to_world_nodes() -> void:
	for tree in self.trees:
		WorldNodes.add_resource_location(tree.position, "wood")

func destroy_all_buildings() -> void:
	var destroy_us = get_tree().get_nodes_in_group("building")
	for i in destroy_us:
		i.destroy_building()


