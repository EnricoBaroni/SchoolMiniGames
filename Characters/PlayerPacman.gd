extends KinematicBody2D
class_name PlayerPacman

onready var animationPlayer = $AnimationPlayer
onready var pivot = $AttackPosition
var current_dir = "None"
var direction = Vector2() #Direccion player
var speed = 75
var lastDirection = true #Si es true es right, si es false es left
enum{
	IDLE,
	MOVE,
	ATTACK
}
var state = IDLE

func _physics_process(delta):
	get_Inputs() #Obtiene inputs de movimiento y accion
	look_at_mouse()

func get_Inputs():
	direction = Vector2(0,0)
	if Input.is_action_pressed("key_left"):
		current_dir = "left"
		direction.x = -1
		lastDirection = false
	if Input.is_action_pressed("key_right"):
		current_dir = "right"
		direction.x = 1
		lastDirection = true
	if Input.is_action_pressed("key_up"):
		current_dir = "up"
		direction.y = -1
	if Input.is_action_pressed("key_down"):
		current_dir = "down"
		direction.y = 1
	direction = direction.normalized() #Para que no sea doble velocidad al ir en diagonales
	direction = move_and_slide(direction * speed)

func look_at_mouse():
	var mousePosition = get_global_mouse_position()
	if self.get_angle_to(mousePosition) > -0.75 and self.get_angle_to(mousePosition) < 0.75: #Derecha
		pivot.position = Vector2(5,0)
		if state == ATTACK:
			animationPlayer.play("attackRight")
		else:
			if direction == Vector2(0,0):
				animationPlayer.play("idleRight")
			else:
				animationPlayer.play("moveRight")
	elif self.get_angle_to(mousePosition) > 2.25 and self.get_angle_to(mousePosition) < 3.15 or self.get_angle_to(mousePosition) < -2.25 and self.get_angle_to(mousePosition) > -3.15: #Izquierda
		pivot.position = Vector2(-5,0)
		if state == ATTACK:
			animationPlayer.play("attackLeft")
		else:
			if direction == Vector2(0,0):
				animationPlayer.play("idleLeft")
			else:
				animationPlayer.play("moveLeft")
	elif self.get_angle_to(mousePosition) > -2.25 and self.get_angle_to(mousePosition) < -0.75: #Arriba
		pivot.position = Vector2(0,-5)
		if state == ATTACK:
			animationPlayer.play("attackUp")
		else:
			if direction == Vector2(0,0):
				animationPlayer.play("idleUp")
			else:
				animationPlayer.play("moveUp")
	elif self.get_angle_to(mousePosition) > 0.75 and self.get_angle_to(mousePosition) < 2.25: #Abajo
		pivot.position = Vector2(0,5)
		if state == ATTACK:
			animationPlayer.play("attackDown")
		else:
			if direction == Vector2(0,0):
				animationPlayer.play("idleDown")
			else:
				animationPlayer.play("moveDown")

func warp_to(pos, dir):
	if dir == current_dir:
		global_position = pos
