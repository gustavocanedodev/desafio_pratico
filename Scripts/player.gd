extends CharacterBody2D

const SPEED = 70.0
var is_control_disabled = false
var knockback_force = Vector2.ZERO
const KNOCKBACK_DECAY = 500.0

func _physics_process(delta: float) -> void:
	if is_control_disabled:
		velocity = knockback_force
		knockback_force = knockback_force.move_toward(Vector2.ZERO, KNOCKBACK_DECAY * delta)
		
		if knockback_force.length() < 10:
			is_control_disabled = false  
	else:
		var direction := Input.get_axis("ui_left", "ui_right")
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)

		velocity.y = 0

	move_and_slide()

func apply_knockback(knockback_force: Vector2) -> void:
	is_control_disabled = true
	self.knockback_force = knockback_force
	self.knockback_force.y = 0
