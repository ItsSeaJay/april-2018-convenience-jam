extends Node2D

export var radius : float = 4.0

onready var area = $Area2D
onready var collision_shape = $Area2D/CollisionShape2D

var color : Color
var i = 0

const Player = preload("res://Entities/Player.gd")

func _ready():
	# Randomize the color of the food item
	color = get_random_color()
	
	# Create an event for when something enters
	area.connect("body_entered", self, "_on_Area2D_body_entered")

func _draw():
	# The drawing needs to be aligned to the collision shape for some reason?
	draw_circle(collision_shape.position, radius, color)

func get_random_color():
	return Color(randf(), randf(), randf())

func _on_Area2D_body_entered(body):
	if not body is Player:
		return
	
	var player = body
	
	player.grow(1.0)
	
	# Remove this Food object from the scene tree
	queue_free()