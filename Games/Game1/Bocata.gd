extends Area2D
class_name Bocata

signal bocata_eaten

func _on_Bocata_body_entered(body):
	if body is PlayerPacman:
		emit_signal("bocata_eaten", body)
	elif body is EnemyPacman:
		emit_signal("bocata_eaten", body)
	queue_free()
