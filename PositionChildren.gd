extends Node3D

@export var radius = 5.0

# Called when the node enters the scene tree for the first time.
func _ready():
	
	var rootPos = position
	var children = get_children()
	var increment = 2.0 * PI / float(children.size())
	
	for i in range(children.size()):
		var childOffset = Vector3(sin(increment * float(i)),0,cos(increment * float(i)))
		childOffset *= float(radius)
		children[i].set_position(childOffset + rootPos)
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
