extends RigidBody3D

@export var speed = 10
@export var maxCollectables = 12

var collected = 0

# Called when the node enters the scene tree for the first time.
# Start
func _ready():
	
	update_display()
	$Control/WinScreen.hide()
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
# Update
func _process(delta):
	var movement = Vector3.ZERO
	
	if Input.is_action_pressed("MoveRight"):
		movement.x += 1
	if Input.is_action_pressed("MoveLeft"):
		movement.x -= 1
	if Input.is_action_pressed("MoveUp"):
		movement.z -= 1
	if Input.is_action_pressed("MoveDown"):
		movement.z += 1
		
	movement = movement * delta * speed
	
	apply_central_impulse(movement)
	
	#print("Input " + str(movement) + " Velocity " + str(linear_velocity))
	pass


func _on_collectable_1_collected():
	collected += 1
	print("Collected")
	
	# Play a sound effect
	$PickupCollected.play()
	
	update_display()
	
	pass # Replace with function body.


func update_display():
	# Update the score
	$Control/CountDisplay.text = "Count: " + str(collected)
	
	if collected == maxCollectables:
		$Control/WinScreen.show()


func _on_button_pressed():
	
	# Reset the current game
	get_tree().reload_current_scene()
	
	pass # Replace with function body.
