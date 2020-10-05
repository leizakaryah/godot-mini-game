extends Area2D

export var speed : int = 100
export var moveDist : int = 100

onready var startX : int = position.x
onready var targetX : int = position.x + moveDist

func _process(delta):
	
	position.x = move_to(position.x, targetX, speed * delta)
	
	if position.x == targetX:
		if targetX == startX:
# warning-ignore:narrowing_conversion
			targetX = position.x + moveDist
		else: 
			targetX = startX
	

# moves "current" towards "to" at the rate of "step"
func move_to (current, to, step):
	
	var new = current
	
	# are we moving positive?
	if new < to:
		new += step
		
		if new > to:
			new = to
	
	# are we moving negative?
	else:
		new -= step
		
		if new < to:
			new = to
			
	return new


func _on_enemy_body_entered(body):
	
	if body.name == "player":
		body.die()
