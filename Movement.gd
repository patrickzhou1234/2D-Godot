extends KinematicBody2D

var velocity = Vector2(0, 0)
var speed = 100
var gravity = 20
var jumpforce = -300
var friction = 0.2

func _physics_process(delta): #Runs every 60 seconds
	if Input.is_action_pressed("Right"): #Checks the right arrow key is being pressed
		$Sprite.play("Run") #Plays an animation
		$Sprite.flip_h = false #Makes the character face right
		velocity.x = speed #Makes the player move the the right
	
	elif Input.is_action_pressed("Left"):
		$Sprite.play("Run")
		$Sprite.flip_h = true
		velocity.x = -speed
	
	else:
		$Sprite.play("Idle")
	
	if Input.is_action_just_pressed("Jump") and is_on_floor(): 
		velocity.y = jumpforce
	
	if !is_on_floor():
		$Sprite.play("Fall")
	
	velocity.y = velocity.y + gravity #Makes gravity
	
	velocity.x = lerp(velocity.x, 0, friction) #Makes you stop
	
	velocity = move_and_slide(velocity, Vector2.UP) #Makes it so you can actually move
