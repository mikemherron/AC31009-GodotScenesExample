extends Node2D

export(NodePath) var player_path

onready var player : Player = get_node(player_path)
onready var width : float = $ColorRect.rect_size.x

func _ready():
	player.connect("health_changed", self, "on_health_changed")
	
func on_health_changed(health) -> void:
	$ColorRect.rect_size.x = width * (float(health) / float(player.maxHealth))
