extends Node2D

func _on_Salida_body_entered(body):
	if body.name == "Player":
		SceneChanger.change_scene("res://Scenes/School.tscn", 'fade')
