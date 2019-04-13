extends KinematicBody2D

export var color : Color = Color(0, 0, 1)
export var radius : float = 4.0
export var speed : float = 64.0
export var cooldown : float = 1.0

onready var bullet = preload("res://Projectiles/Bullet.tscn")

var offset = 0.0
var heat = 0.0

func _process(delta):
	var direction = Vector2(0.0, 0.0)
	
	# Movement
	if (Input.is_action_pressed("move_up")):
		direction.y -= 1.0
	elif (Input.is_action_pressed("move_down")):
		direction.y += 1.0
	
	if (Input.is_action_pressed("move_left")):
		direction.x -= 1.0
	elif (Input.is_action_pressed("move_right")):
		direction.x += 1.0
	
	# Shooting
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
	
	# Cool down the gun
	heat = max(heat - delta, 0.0)
	
	# Move the player according to their direction
	translate(move_and_slide(direction * speed * delta))

func _draw():
	# Draw a circle to represent the player character
	draw_circle(position, radius + offset, color)