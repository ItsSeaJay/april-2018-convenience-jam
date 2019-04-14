extends KinematicBody2D

export var radius : float = 64.0
export var color : Color
export var speed : float = 3.0
export var direction : Vector2 = Vector2(0.0, 0.0)

onready var collision_shape = $CollisionShape2D

func _ready():
	assert(direction.x <= 1.0 and direction.y <= 1.0)

func _process(delta):
	translate(move_and_slide(direction * speed))

func _draw():
	draw_circle(collision_shape.position, radius, color)