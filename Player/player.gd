extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	#if not is_on_floor():
	#	velocity.y += gravity * delta

	# Handle jump.
	#if Input.is_action_just_pressed("ui_select") and is_on_floor():
	#	velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_up", "ui_down")
	if direction:
		velocity.y = direction * SPEED
	else:
		velocity.y = move_toward(velocity.x, 0, SPEED)
		
	
	#Prevent player to go above the limit
	if position.y <= 363:
		position.y = 363
	
	#Prevent player to go below the limit
	if position.y > 594:
		position.y = 594
	
	#Check the current position of the player in the scene		
	#print(position.y)

	move_and_slide()


func _on_area_2d_area_entered(area):
	if area.is_in_group("petePower"):
		print("power bootsss")
