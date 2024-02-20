extends Node

var scorePlayer : Label
var scoreEnemy : Label

var scoreP : int
var scoreE : int

@export var scoreMax : int = 0
@export var shaderCRT : ColorRect

signal gameEnded(player : String)

func _ready():
	scorePlayer = get_node("PlayerScore")
	scoreEnemy = get_node("EnemyScore")
	
	scoreP = 0
	scoreE = 0
	
	shaderCRT.visible = G_VAR._get_shader()
	scoreMax = G_VAR._get_lengh()

func _on_ball_scored(who):
	match who:
		"Player":
			scoreP += 1
			scorePlayer.text = str(scoreP)

		"Enemy":
			scoreE += 1
			scoreEnemy.text = str(scoreE)

	game_ended()

func game_ended() -> void:
	if scoreP < scoreMax && scoreE < scoreMax:
		return
	gameEnded.emit("Player" if scoreP >= scoreMax else "Enemy")
