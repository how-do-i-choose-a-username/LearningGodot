extends Node3D

@export var rotationSpeed = 90.0

signal Collected

var axis

# Called when the node enters the scene tree for the first time.
func _ready():
	
	axis = Vector3(1,2,3).normalized()
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	var angle = rotationSpeed / 180.0 * PI * delta
	
	rotate(axis, angle)
	
	pass


func _on_area_3d_body_entered(_body):
	
	print("DEAD")
	# DIE FOOL
	queue_free()
	
	Collected.emit()
	
	pass # Replace with function body.
