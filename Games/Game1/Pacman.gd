extends Area2D

var direction = Vector2(0,0)
var SPEED = 50
onready var walls = get_parent().get_node("Walls")

func _ready():
	$AnimatedSprite.play("moving")

func _process(delta):
	if Input.is_action_pressed("ui_up"):
		direction = Vector2(0,-1)
		rotation = deg2rad(-90)
	elif Input.is_action_pressed("ui_down"):
		direction = Vector2(0,1)
		rotation = deg2rad(90)
	elif Input.is_action_pressed("ui_right"):
		direction = Vector2(1,0)
		rotation = deg2rad(0)
	elif Input.is_action_pressed("ui_left"):
		direction = Vector2(-1,0)
		rotation = deg2rad(180)
	direction = direction.normalized()
	
	position += SPEED * direction * delta
