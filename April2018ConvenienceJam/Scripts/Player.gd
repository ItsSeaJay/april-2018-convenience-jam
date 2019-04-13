extends KinematicBody2D

export var color : Color = Color(0, 0, 1)
export var radius : float = 4.0

func _draw():
	# Draw a circle to represent the player character
	draw_circle(position, radius, color)