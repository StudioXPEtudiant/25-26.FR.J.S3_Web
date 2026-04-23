extends Node2D

var web = null
var attached = false
var target_position =Vector2.ZERO
var speed = 600

func _physics_process(delta):
	if !attached:
		position += direction * speed * delta 
		
func _on_body_entered(body):
	if body.is_in_group(grapplable):
		attached = true
		target_position = global_position
