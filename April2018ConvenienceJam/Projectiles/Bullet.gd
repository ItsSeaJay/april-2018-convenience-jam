extends Area2D

export var speed = 512

func _process(delta):
	translate(Vector2(speed * delta, 0.0))
