extends Area2D

export var speed = 1024

func _process(delta):
	translate(Vector2(cos(rotation) * speed * delta, sin(rotation) * speed * delta))
