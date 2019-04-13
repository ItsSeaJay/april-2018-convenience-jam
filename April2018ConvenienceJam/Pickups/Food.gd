extends StaticBody2D

export var radius : float = 4.0

onready var collision_shape = self.get_child(0)

var color : Color

func _ready():
	# Randomize the color of the food item
	color = get_random_color()

func _draw():
	draw_circle(position, radius, color)

func get_random_color():
	return Color(randf(), randf(), randf())