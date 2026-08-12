extends Node

var player: Player

func instance_node(node, location: Vector2, parent: Node):
	var node_instance = node.instantiate()
	node_instance.global_position = location
	parent.add_child(node_instance)