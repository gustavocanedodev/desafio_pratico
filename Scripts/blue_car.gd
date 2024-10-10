extends Area2D

const SPEED = 100.0
var player

func _ready() -> void:
	connect("body_entered", Callable(self, "_on_body_entered"))
	player = $"../Player"

func _physics_process(delta: float) -> void:
	# Se o controle do carro do jogador estiver desativado, o BlueCar não se move
	if not player.is_control_disabled:
		position.y += SPEED * delta

	# Remove o BlueCar quando sai da tela
	if position.y > 720:
		queue_free()

func _on_body_entered(body: Node2D) -> void:
	# Verifica se o corpo com o qual colidiu é o player e se ele tem a função apply_knockback
	if body.has_method("apply_knockback"):
		# Calcula a direção do knockback com base na posição global do BlueCar e do corpo
		var knockback_direction = (body.global_position - global_position).normalized()
		
		# Aplica o knockback no corpo do player, deixando o player decidir a força
		body.apply_knockback(knockback_direction)
