extends KinematicBody2D

export var color : Color

func _draw():
	var center = position
	var color = Color(1.0, 0.0, 0.0)
	
	draw_circle(center, 360.0, color)