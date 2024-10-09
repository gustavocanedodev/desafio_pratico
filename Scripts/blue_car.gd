extends Area2D

const SPEED = 100.0

func _ready() -> void:
	connect("body_entered", Callable(self, "_on_body_entered"))

func _physics_process(delta: float) -> void:
	position.y += SPEED * delta

	if position.y > 720:
		queue_free()

func _on_body_entered(body: Node2D) -> void:
	var knockback_direction = (body.global_position - global_position).normalized()
	var knockback_strength = 200.0
	var knockback_force = knockback_direction * knockback_strength

	body.apply_knockback(knockback_force)
