extends Node2D

export var radius : float = 4.0

var color : Color

func _ready():
	color = get_random_color()

func _draw():
	draw_circle(position, radius, color)

func get_random_color():
	return Color(randf(), randf(), randf())