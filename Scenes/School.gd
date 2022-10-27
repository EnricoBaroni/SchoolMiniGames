extends Node2D
var entering = false
onready var player = $Player

func _on_Salida_body_entered(body):
	entering = false
	SceneChanger.change_scene("res://Scenes/House.tscn", 'fade')

func _on_Game1_body_entered(body):
	if entering == false:
		entering = true
		SceneChanger.change_scene("res://Games/Game1/Game1.tscn", 'fade')

func _on_Game2_body_entered(body):
	if entering == false:
		entering = true
		SceneChanger.change_scene("res://Games/Game2/Game2.tscn", 'fade')

func _on_Game3_body_entered(body):
	if entering == false:
		entering = true
		SceneChanger.change_scene("res://Games/Game3/Game3.tscn", 'fade')

func _on_Game4_body_entered(body):
	if entering == false:
		entering = true
		SceneChanger.change_scene("res://Games/Game4/Game4.tscn", 'fade')
