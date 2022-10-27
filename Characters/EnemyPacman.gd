extends KinematicBody2D
class_name EnemyPacman

signal attack_player

var speed = 150
var start_pos
var path:= PoolVector2Array() setget set_path

func set_path(value : PoolVector2Array) -> void:
	path = value


func _on_Hitbox_body_entered(body):
	if body is PlayerPacman:
		emit_signal("attack_player")
