extends Actor

func _ready() -> void:
	set_physics_process(true)
	_velocity.x = -speed.x
	
func _on_StompDetector_body_entered(_body: PhysicsBody2D) -> void:
	if _body.global_position.y > get_node("StompDetector").global_position.y:
		return
	#get_node("CollisionShape2D").disabled = true
	queue_free()

func _physics_process(delta: float) -> void:
	_velocity.y += gravity * delta
	if is_on_wall():
		_velocity.x *= -1.0
	set_velocity(_velocity)
	set_up_direction(FLOOR_NORMAL)
	move_and_slide()
	_velocity.y = velocity.y



