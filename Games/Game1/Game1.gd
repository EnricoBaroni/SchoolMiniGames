extends Node2D

onready var player = $PlayerPacman
onready var exitL = $"Exit-L"
onready var exitR = $"Exit-R"
var canTp = true
var bocatas_left = 45
var lives = 4
var score = 0
var enemyScore = 0

func _ready():
	$Bocatas.connect("bocata_eaten", self, "_on_Bocata_eaten")
	$EnemyPacman.connect("attack_player", self, "_on_Attack_player")

func _on_Bocata_eaten(body):
	bocatas_left -= 1
	if body is PlayerPacman:
		add_score(1)
	elif body is EnemyPacman:
		add_enemy_score(1)
	if bocatas_left == 0:
		level_end()
func _on_Attack_player():
	lives -= 1
	draw_lives(lives)
	if lives <= 0:
		game_over()

func new_game(lives: int):
	draw_lives(lives)
	$GameText.visible = false

func add_score(value: int):
	score += value
	$Score.text = str(score)
func add_enemy_score(value: int):
	enemyScore += value
	$ScoreEnemy.text = str(enemyScore)

func draw_lives(lives: int):
	$Life1.visible = lives >= 1
	$Life2.visible = lives >= 2
	$Life3.visible = lives >= 3
	$Life4.visible = lives >= 4

func level_end():
	$LevelWon.visible = true

func game_over():
	$GameOver.visible = true

func _on_ExitL_body_entered(body):
	if body.name == "PlayerPacman" and canTp:
		body.position = exitR.global_position
		canTp = false
func _on_ExitR_body_entered(body):
	if body.name == "PlayerPacman" and canTp:
		body.position = exitL.global_position
		canTp = false
func _on_ExitL_body_exited(body):
	if body.name == "PlayerPacman":
		canTp = true
func _on_ExitR_body_exited(body):
	if body.name == "PlayerPacman":
		canTp = true
