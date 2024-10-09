extends Area2D

const FALL_SPEED = 100.0


func _on_body_entered(body: Node2D) -> void:
	body.add_fuel(7)
	print("+7 fuel")
	queue_free()

func _physics_process(delta: float) -> void:
	position.y += FALL_SPEED * delta
	
	if position.y > 720:
		queue_free()
