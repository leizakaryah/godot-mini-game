extends Control

onready var scoreText = get_node("scoretext")

func _ready():
	
	scoreText.text = "00"
	
func set_score_text(score):
	
	scoreText.text = str(score)


