extends KinematicBody2D

export var color : Color = Color(0, 0, 1)
export var radius : float = 32.0
export var metabolism : float = 0.1
export var weakness : float = 0.33
export var speed : float = 256.0
export var cooldown : float = 1.0

onready var bullet = preload("res://Projectiles/Bullet.tscn")
onready var camera = $Camera2D
onready var collision_shape = $CollisionShape2D
onready var hitbox = $Area2D

var offset = 0.0
var heat = 0.0

const Enemy = preload("res://Entities/Enemy.gd")

func _ready():
	hitbox.connect("body_entered", self, "_on_Area2D_body_entered")

func _process(delta):	
	move(delta)
	#shoot()
	
	# Cool down the gun
	heat = max(heat - delta, 0.0)

func _draw():
	# Draw a circle to represent the player character
	draw_circle(collision_shape.position, radius + offset, color)

func move(delta):
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

func shoot():
	if (Input.is_action_pressed("fire") and heat == 0.0):
		var world = self.get_parent()
		var instance = bullet.instance()
		
		# Apply heat to the gun to prevent endless fire
		heat = cooldown
		
		# Set the transform of the new instance
		instance.position = position
		
		# Rotate the bullet to face the direction we're aiming at
		#instance.rotation
		
		# Drop that instance into the world
		world.add_child(instance)

func grow(amount):
	# Increase the radius of the player overall
	radius += amount
	
	# Resize their hitbox to match
	collision_shape.shape.radius += amount
	
	# Zoom the camera out to ensure the player can see properly
	camera.zoom += Vector2(metabolism / 100, metabolism / 100)
	
	# Update the node to ensure it calls it's draw event again
	update()

func shrink(amount):
	# Decrease the radius of the player overall
	radius -= amount
	
	# Resize their hitbox to match
	collision_shape.shape.radius -= amount
	
	# Zoom the camera out to ensure the player can see properly
	camera.zoom -= Vector2(0.01, 0.01)
	
	# Update the node to ensure it calls it's draw event again
	update()

func die():
	get_tree().change_scene("res://Levels/GameOverScreen.tscn")
	
	queue_free()

func _on_Area2D_body_entered(body):
	if body is Enemy:
		var enemy = body
		
		print(enemy.radius)
		
		if (enemy.radius >= radius * 2):
			die()
		else:
			shrink(weakness)