extends CharacterBody2D


const SPEED = 300.0

# Extra points that will be added to the score if the player grabs a power up
var bonusPoints : int = 0

var is_dead : bool = false

func _physics_process(delta):
	

	if not is_dead:
		# Get the input direction and handle the movement/deceleration.
		# As good practice, you should replace UI actions with custom gameplay actions.
		var direction = Input.get_axis("ui_up", "ui_down")
		if direction:
			velocity.y = direction * SPEED
		else:
			velocity.y = move_toward(velocity.y, 0, SPEED)
			
		#Prevent player to go above the limit
		if position.y <= 363:
			position.y = 363
		
		#Prevent player to go below the limit
		if position.y > 594:
			position.y = 594
		
		#Player is constantly slowing down.
		velocity.x -= 0.05
		
		if velocity.x > 600:
			velocity.x = 600
		elif velocity.x > 0:
			position.x += velocity.x * delta
		else:
			position.x += 0
			velocity.x = 0
			is_dead = true
			
		move_and_slide()

func _on_area_2d_area_entered(area):
	if area.is_in_group("petePower"):
		#print("pete powaaahhh")
		velocity.x+=100
		bonusPoints = 10000
		#area.queue_free()
		
	if area.is_in_group("mousyPower"):
		#print("mouse powaaahhh")
		velocity.x+=100
		bonusPoints = 15000
		
	if area.is_in_group("debuffOrange"):
		#print("orange mid")
		velocity.x -=50
		#area.queue_free()
	if area.is_in_group("stopSign"):
		#print("you dea")
		velocity.x = 0
		is_dead = true;
