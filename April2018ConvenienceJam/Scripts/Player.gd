extends KinematicBody2D

export var color : Color = Color(0, 0, 1)
export var radius : float = 4.0
export var speed : float = 64.0

var offset = 0.0

func _process(delta):
	var direction = Vector2(0.0, 0.0)
	
	if (Input.is_action_pressed("move_up")):
		direction.y -= 1.0
	elif (Input.is_action_pressed("move_down")):
		direction.y += 1.0
	
	if (Input.is_action_pressed("move_left")):
		direction.x -= 1.0
	elif (Input.is_action_pressed("move_right")):
		direction.x += 1.0
	
	# Move the player according to their direction
	translate(move_and_slide(direction * speed * delta))

func _draw():
	# Draw a circle to represent the player character
	draw_circle(position, radius + offset, color)