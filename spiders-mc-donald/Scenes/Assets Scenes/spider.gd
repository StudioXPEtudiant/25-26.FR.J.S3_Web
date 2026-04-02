extends CharacterBody2D
@onready var walking: AnimatedSprite2D = $Walking

const SPEED = 300
const JUMP_VELOCITY = -400

func _physics_process(delta: float) -> void:
	
	if velocity.x > 1 or velocity.x < -1:
		walking.animation = "running"
	else:
		walking.animation = "stand"
		
	if not is_on_floor(): 
		velocity += get_gravity() * delta 

	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
