extends Node2D

export var size : Vector2 = Vector2(640, 480)
export var population_limit : Vector2 = Vector2(128, 256)

onready var food = preload("res://Pickups/Food.tscn")
onready var population = int(rand_range(population_limit.x, population_limit.y))

# Called when the node enters the scene tree for the first time.
func _ready():
	assert(size.x > 0 and size.y > 0)
	assert(population_limit.x <= population_limit.y)
	
	# Generate a random amount of food
	for i in range(population):
		# Instantiate a new food node
		var instance = food.instance()
		
		# Move that instance to a random position between nodes
		instance.set_position(Vector2(randf() * size.x, randf() * size.y))
		
		# Add that node as a child in the scene tree
		add_child(instance)