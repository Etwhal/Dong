extends Node

var scorePlayer : Label
var scoreEnemy : Label

var scoreP : int
var scoreE : int
# Called when the node enters the scene tree for the first time.
func _ready():
	scorePlayer = get_node("PlayerScore")
	scoreEnemy = get_node("EnemyScore")
	
	scoreP = 0
	scoreE = 0
	pass # Replace with function body.

func _on_ball_scored(who):
	match who:
		"Player":
			scoreP += 1
			scorePlayer.text = str(scoreP)
			pass
		"Enemy":
			scoreE += 1
			scoreEnemy.text = str(scoreE)
			pass
	game_ended()

func game_ended() -> void:
	if scoreP < 9 || scoreE < 9:
		return
