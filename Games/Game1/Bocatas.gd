extends Node2D

signal bocata_eaten

func _on_Bocata_eaten():
	emit_signal("bocata_eaten")
