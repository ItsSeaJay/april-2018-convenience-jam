extends Area2D

export var radius : float = 4.0

onready var collision_shape = self.get_child(0)

var color : Color

func _ready():
	# Randomize the color of the food item
	color = get_random_color()

func _draw():
	# The drawing needs to be aligned to the collision shape for some reason?
	draw_circle(collision_shape.position, radius, color)

func get_random_color():
	return Color(randf(), randf(), randf())